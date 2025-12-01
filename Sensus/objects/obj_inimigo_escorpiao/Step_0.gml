// Atualiza cooldown de dano
if (dano_cooldown > 0) dano_cooldown -= 1;

// RECEBER DANO
if (!escorpiao_invulneravel && dano_cooldown <= 0) {
    if (place_meeting(x, y, obj_slash)) {
        escorpiao_hits += 1;
        dano_cooldown = dano_cooldown_max;

        if (escorpiao_hits >= escorpiao_hits_max) {
            // Morre de vez
            escorpiao_estado = "morrendo";
            sprite_index = escorpiao_morrendo;
            image_index = 0;
            image_speed = 0.5;
            escorpiao_invulneravel = true;
        } else {
            // Knockback + animação de dano
            escorpiao_estado = "dano_knockback";
            var dir_to_player = point_direction(x, y, obj_player.x, obj_player.y);
            knockback_dir = dir_to_player + 180;
            knockback_timer = 0;
            escorpiao_invulneravel = true;
        }
    }
}

// MORRENDO
if (escorpiao_estado == "morrendo") {
    if (image_index >= image_number - 1) {
        image_speed = 0;
        alpha_morte -= 0.05;
        image_alpha = alpha_morte;
        if (alpha_morte <= 0.05) {
            instance_destroy();
        }
    }
}

// PARADO
else if (escorpiao_estado == "parado") {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist < distancia_ativacao) {
        escorpiao_estado = "acordando";
        sprite_index = escorpiao_alerta;
        image_index = 0;
        image_speed = 1;
        global.larvas_alerta = true;
    }
}

// ACORDANDO
else if (escorpiao_estado == "acordando") {
    if (obj_player.x > x) image_xscale = -1; else image_xscale = 1;
    if (image_index >= image_number - 1) {
        escorpiao_estado = "seguindo";
        sprite_index = escorpiao_andando;
        image_speed = 1;
    }
}

// SEGUINDO
else if (escorpiao_estado == "seguindo") {
    if (obj_player.x > x) image_xscale = -1; else image_xscale = 1;
    var dist = point_distance(x, y, obj_player.x, obj_player.y);

    if (ataque_cooldown > 0) ataque_cooldown -= 1;

    if (dist < distancia_ataque && ataque_cooldown <= 0) {
        escorpiao_estado = "atacando";
        sprite_index = escorpiao_ataque;
        image_index = 0;
        image_speed = 1;
        ataque_em_andamento = false;
        ataque_tempo = 0;
    }
    else if (dist >= distancia_ataque_distancia && ataque_cooldown <= 0) {
        escorpiao_estado = "atacando_distancia";
        sprite_index = escorpiao_ataque_2;
        image_index = 0;
        image_speed = 1;
        gosma_criada = false;
    }
    else {
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

        if (place_meeting(x, y, obj_hitbox_inimigos)) {
            with (obj_player) {
                receber_dano(other);
            }
        }
    }
}

// ATACANDO (dash com direção travada)
else if (escorpiao_estado == "atacando") {
    var frame_atual = floor(image_index);

    if (!ataque_em_andamento && frame_atual >= ataque_frame_inicio) {
        ataque_dir_locked = point_direction(x, y, obj_player.x, obj_player.y);
        ataque_xscale_locked = (obj_player.x > x) ? -1 : 1;
        ataque_em_andamento = true;
        ataque_tempo = 0;
    }

    image_xscale = ataque_xscale_locked;

    if (ataque_em_andamento) {
        ataque_tempo += 1;
        var new_x = x + lengthdir_x(ataque_velocidade, ataque_dir_locked);
        var new_y = y + lengthdir_y(ataque_velocidade, ataque_dir_locked);

        if (!place_meeting(new_x, new_y, obj_colisor_inimigos)
        && !place_meeting(new_x, new_y, tiles)
        && !place_meeting(new_x, new_y, colisivo)) {
            x = new_x;
            y = new_y;
        }

        if (place_meeting(x, y, obj_hitbox_inimigos)) {
            with (obj_player) {
                receber_dano(other);
            }
        }

        if (ataque_tempo >= ataque_duracao) {
            ataque_em_andamento = false;
        }
    }

    if (image_index >= image_number - 1) {
        escorpiao_estado = "seguindo";
        sprite_index = escorpiao_andando;
        image_speed = 1;
        ataque_cooldown = ataque_cooldown_max;
        ataque_em_andamento = false;
        ataque_tempo = 0;
    }
}

// ATACANDO À DISTÂNCIA (spawn da gosma no frame 10)
else if (escorpiao_estado == "atacando_distancia") {
    var frame_atual = floor(image_index);

    // Sempre aponta para o player
    if (obj_player.x > x) image_xscale = -1; else image_xscale = 1;

    // No frame 10, cria a gosma
    if (frame_atual == 10 && !gosma_criada) {
        var gosma = instance_create_layer(x, y - 22, "Ins_Entidades", obj_gosma);
        gosma.direction = point_direction(x, y, obj_player.x, obj_player.y);
        gosma.speed = 1.5; // velocidade reduzida
        gosma_criada = true;
    }

    if (image_index >= image_number - 1) {
        escorpiao_estado = "seguindo";
        sprite_index = escorpiao_andando;
        image_speed = 1;
        ataque_cooldown = ataque_cooldown_max;
        gosma_criada = false;
    }
}

// DANO + KNOCKBACK
else if (escorpiao_estado == "dano_knockback") {
    knockback_timer += 1;
    var new_x = x + lengthdir_x(knockback_speed, knockback_dir);
    var new_y = y + lengthdir_y(knockback_speed, knockback_dir);

    if (!place_meeting(new_x, new_y, obj_colisor_inimigos)
    && !place_meeting(new_x, new_y, tiles)
    && !place_meeting(new_x, new_y, colisivo)) {
        x = new_x;
        y = new_y;
    } else {
        knockback_timer = knockback_duration;
    }

    if (knockback_timer >= knockback_duration) {
        escorpiao_estado = "dano";
        sprite_index = escorpiao_dano_frente;
        image_index = 0;
        image_speed = 1;
    }
}

// DANO
else if (escorpiao_estado == "dano") {
    if (image_index >= image_number - 1) {
        escorpiao_estado = "seguindo";
        sprite_index = escorpiao_andando;
        image_speed = 1;
        escorpiao_invulneravel = false;
    }
}