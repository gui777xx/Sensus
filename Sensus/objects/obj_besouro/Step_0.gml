// --- Morte: receber dano do slash e processar fade-out ---
if (besouro_estado != "morrendo") {
    if (place_meeting(x, y, obj_slash)) {
        besouro_estado = "morrendo";
        sprite_index = besouro_morrendo;
        image_index = 0;
        image_speed = 0.5;
    }
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
    exit;
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
    image_xscale = (obj_player.x > x) ? -1 : 1;

    if (image_index >= image_number - 1) {
        besouro_estado = "seguindo";
        sprite_index = besouro_andando;
        image_speed = 1;
    }
}

// --- Seguindo ---
else if (besouro_estado == "seguindo") {
    image_xscale = (obj_player.x > x) ? -1 : 1;

    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (ataque_cooldown > 0) ataque_cooldown -= 1;

    // Ataca somente se estiver longe
    if (dist > distancia_ataque && ataque_cooldown <= 0) {
        besouro_estado = "atacando";
        sprite_index = besouro_ataque;
        image_index = 0;
        image_speed = 1;

        // Mira nas pernas do player usando bbox_bottom
        var alvo_x = obj_player.x;
        var alvo_y = obj_player.bbox_bottom;
        ataque_dir = point_direction(x, y, alvo_x, alvo_y);

        ataque_tempo = 0;
        ataque_cooldown = ataque_cooldown_max;
        ataque_fase = "carregando";
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

        if (place_meeting(x, y, obj_player)) {
            with (obj_player) {
                receber_dano(other);
            }
        }
    }
}

// --- Atacando ---
else if (besouro_estado == "atacando") {
    image_xscale = (obj_player.x > x) ? -1 : 1;
    ataque_tempo += 1;

    if (ataque_fase == "carregando") {
        if (image_index >= frame_inicio_dash) {
            ataque_fase = "dash";
            ataque_velocidade = irandom_range(6, 10); // dash mais lento
        }
    }

    else if (ataque_fase == "dash") {
        var new_x = x + lengthdir_x(ataque_velocidade, ataque_dir);
        var new_y = y + lengthdir_y(ataque_velocidade, ataque_dir);

        if (!place_meeting(new_x, new_y, obj_colisor_inimigos)
        && !place_meeting(new_x, new_y, tiles)
        && !place_meeting(new_x, new_y, colisivo)) {
            x = new_x;
            y = new_y;
        } else {
            move_contact_solid(ataque_dir, ataque_velocidade);
        }

        if (place_meeting(x, y, obj_player)) {
            with (obj_player) {
                receber_dano(other);
                receber_dano(other); // dano duplicado
            }
        }

        ataque_velocidade = max(ataque_velocidade - 1, 4);

        if (image_index >= image_number - 1) {
            besouro_estado = "seguindo";
            sprite_index = besouro_andando;
            image_speed = 1;
            ataque_fase = "";
        }
    }
}