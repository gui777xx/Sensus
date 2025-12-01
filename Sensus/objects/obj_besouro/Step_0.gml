// Invulnerabilidade pós-dano
if (invulneravel_timer > 0) {
    invulneravel_timer -= 1;
    invulneravel = true;
} else if (besouro_estado != "dano" && besouro_estado != "morrendo") {
    invulneravel = false;
}

// --- Estado de dano ---
if (besouro_estado == "dano") {
    image_xscale = (obj_player.x > x) ? -1 : 1;

    // Knockback ativo com colisão
    if (knockback_timer > 0) {
        knockback_timer -= 1;

        var new_x = x + lengthdir_x(knockback_vel, knockback_dir);
        var new_y = y + lengthdir_y(knockback_vel, knockback_dir);

        if (!place_meeting(new_x, new_y, obj_colisor_inimigos)
        && !place_meeting(new_x, new_y, tiles)
        && !place_meeting(new_x, new_y, colisivo)) {
            x = new_x;
            y = new_y;
        } else {
            // Se colidir com parede/colisor, cancela o knockback
            knockback_timer = 0;
            knockback_vel = 0;
        }

        // Desaceleração
        knockback_vel *= knockback_drag;
    }

    // Ao terminar a animação de dano, resolve vida/estado
    if (image_index >= image_number - 1) {
        hits_restantes -= 1;

        if (hits_restantes <= 0) {
            besouro_estado = "morrendo";
            sprite_index = besouro_morrendo;
            image_index = 0;
            image_speed = 0.5;
            invulneravel = false;
        } else {
            besouro_estado = "seguindo";
            sprite_index = besouro_andando;
            image_speed = 1;
            // invulnerável até invulneravel_timer zerar
        }
    }
    exit; // nada além acontece enquanto está em dano
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

    // Inicia ataque (dash) se estiver na janela
    if (dist > distancia_ataque && ataque_cooldown <= 0) {
        besouro_estado = "atacando";
        sprite_index = besouro_ataque;
        image_index = 0;
        image_speed = 1;

        // Mira com leve desvio controlado
        var alvo_x = obj_hitbox_inimigos.x;
        var alvo_y = obj_hitbox_inimigos.bbox_bottom;
        var dir_base = point_direction(x, y, alvo_x, alvo_y);
        var desvio   = irandom_range(-ataque_desvio_max, ataque_desvio_max);
        ataque_dir = dir_base + desvio;

        ataque_tempo = 0;
        ataque_cooldown = ataque_cooldown_max;
        ataque_fase = "carregando";
        distancia_ataque = irandom_range(distancia_ataque_min, distancia_ataque_max);
    }

    // Anda em direção ao player com colisão
    else if (dist < distancia_seguir) {
        contador_passos += 1;
        if (contador_passos >= intervalo_passos) {
            contador_passos = 0;
            var dir = point_direction(x, y, obj_hitbox_inimigos.x, obj_hitbox_inimigos.y);
            var new_x = x + lengthdir_x(velocidade, dir);
            var new_y = y + lengthdir_y(velocidade, dir);

            if (!place_meeting(new_x, new_y, obj_colisor_inimigos)
            && !place_meeting(new_x, new_y, tiles)
            && !place_meeting(new_x, new_y, colisivo)) {
                x = new_x;
                y = new_y;
            }
        }
    }
}

// --- Atacando ---
else if (besouro_estado == "atacando") {
    image_xscale = (obj_player.x > x) ? -1 : 1;
    ataque_tempo += 0.4;

    if (ataque_fase == "carregando") {
        if (image_index >= frame_inicio_dash) {
            ataque_fase = "dash";
            ataque_velocidade = 3;
        }
    }

    else if (ataque_fase == "dash") {
        var new_x = x + lengthdir_x(ataque_velocidade, ataque_dir);
        var new_y = y + lengthdir_y(ataque_velocidade, ataque_dir);

        // Colisão do dash
        if (!place_meeting(new_x, new_y, obj_colisor_inimigos)
        && !place_meeting(new_x, new_y, tiles)
        && !place_meeting(new_x, new_y, colisivo)) {
            x = new_x;
            y = new_y;
        } else {
            // Se colidir, cancela o dash e volta a seguir
            besouro_estado = "seguindo";
            sprite_index = besouro_andando;
            image_speed = 1;
            ataque_fase = "";
        }

        // Dano ao player se encostar
        if (place_meeting(x, y, obj_hitbox_inimigos)) {
            with (obj_player) {
                receber_dano(other);
            }
        }

        // Dash termina no fim da animação
        if (image_index >= image_number - 1) {
            besouro_estado = "seguindo";
            sprite_index = besouro_andando;
            image_speed = 1;
            ataque_fase = "";
        }
    }
}