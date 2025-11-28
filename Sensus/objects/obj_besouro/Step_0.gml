// --- Morte ---
if (place_meeting(x, y, obj_slash)) {
    besouro_estado = "morrendo";
    sprite_index = besouro_morrendo;
    image_index = 0;
    image_speed = 0.5;
}

if (besouro_estado == "morrendo") {
    if (image_index >= image_number - 1) {
        image_speed = 0;
        alpha_morte -= 0.05;
        image_alpha = alpha_morte;
        if (alpha_morte <= 0.05) {
            instance_destroy();
        }
    }
}

// --- Parado ---
if (besouro_estado == "parado") {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist < distancia_ativacao) {
        besouro_estado = "acordando";
        sprite_index = besouro_alerta;
        image_index = 0;
        image_speed = 1;
        global.larvas_alerta = true;
    }
}

// --- Acordando ---
else if (besouro_estado == "acordando") {
    if (obj_player.x > x) image_xscale = -1; else image_xscale = 1;

    if (image_index >= image_number - 1) {
        besouro_estado = "seguindo";
        sprite_index = besouro_andando;
        image_speed = 1;
    }
}

// --- Seguindo ---
else if (besouro_estado == "seguindo") {
    if (obj_player.x > x) image_xscale = -1; else image_xscale = 1;

    var dist = point_distance(x, y, obj_player.x, obj_player.y);

    if (ataque_cooldown > 0) ataque_cooldown -= 1;

    if (dist < distancia_ataque && ataque_cooldown <= 0) {
        besouro_estado = "atacando";
        sprite_index = besouro_ataque;
        image_index = 0;
        image_speed = 1;
        ataque_dir = point_direction(x, y, obj_player.x, obj_player.y);
        ataque_tempo = 0;
        ataque_cooldown = ataque_cooldown_max;

        // Sorteia nova distância para o próximo ataque
        distancia_ataque = irandom_range(distancia_ataque_min, distancia_ataque_max);
    } else {
        contador_passos += 1;
        if (contador_passos >= intervalo_passos) {
            contador_passos = 0;
            var dir = point_direction(x, y, obj_player.x, obj_player.y);
            var new_x = x + lengthdir_x(velocidade, dir);
            var new_y = y + lengthdir_y(velocidade, dir);

            if (!place_meeting(new_x, new_y, obj_colisor_inimigos) 
            && !place_meeting(new_x, new_y, tiles) 
            && !place_meeting(new_x, new_y, colisivo)) {
                x = new_x;
                y = new_y;
            }
        }

        // Dano por colisão enquanto anda
        if (place_meeting(x, y, obj_player)) {
            with (obj_player) {
                receber_dano(other);
            }
        }
    }
}

// --- Atacando ---
else if (besouro_estado == "atacando") {
    if (obj_player.x > x) image_xscale = -1; else image_xscale = 1;

    ataque_tempo += 1;

    if (image_index >= frame_inicio_dash) {
        // Burst inicial no frame 10
        if (image_index == frame_inicio_dash) {
            if (!ataque_combo) {
                ataque_velocidade = irandom_range(burst_min, burst_max); // primeiro dash
            } else {
                ataque_velocidade = irandom_range(burst_max, burst_max + 4); // segundo dash mais forte
            }
        } else {
            ataque_velocidade = 10;
        }

        var new_x = x + lengthdir_x(ataque_velocidade, ataque_dir);
        var new_y = y + lengthdir_y(ataque_velocidade, ataque_dir);

        if (!place_meeting(new_x, new_y, obj_colisor_inimigos) 
        && !place_meeting(new_x, new_y, tiles) 
        && !place_meeting(new_x, new_y, colisivo)) {
            x = new_x;
            y = new_y;
        }

        // Dano por colisão durante o Dash
        if (place_meeting(x, y, obj_player)) {
            with (obj_player) {
                receber_dano(other);
            }
        }
    }

    // Sai do ataque quando a animação terminar
    if (image_index >= image_number - 1) {
        var dist = point_distance(x, y, obj_player.x, obj_player.y);

        if (!ataque_combo && dist < distancia_ataque_min) {
            // Engata segundo dash
            ataque_combo = true;
            besouro_estado = "atacando";
            sprite_index = besouro_ataque;
            image_index = 0;
            image_speed = 1;
            ataque_dir = point_direction(x, y, obj_player.x, obj_player.y);
            ataque_tempo = 0;
        } else {
            // Volta ao normal
            ataque_combo = false;
            besouro_estado = "seguindo";
            sprite_index = besouro_andando;
            image_speed = 1;
        }
    }
}