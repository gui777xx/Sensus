// --- Checa se foi atingida pelo slash ---
if (place_meeting(x, y, obj_slash)) {
    larva_estado = "morrendo";
    sprite_index = Larva_morrendo_2;
    image_index = 0;
    image_speed = 0.5; // velocidade da animação de morte
}

// --- Estado Morrendo ---
if (larva_estado == "morrendo") {
    if (image_index >= image_number - 1) {
        image_speed = 0;
        alpha_morte -= 0.05;
        image_alpha = alpha_morte;

        if (alpha_morte <= 0.05) {
            instance_destroy(); // remove a larva
        }
    }
}

// --- Estado Surgindo ---
else if (larva_estado == "surgindo") {
    // Quando terminar a animação de surgimento, passa direto para seguir
    if (image_index >= image_number - 1) {
        larva_estado = "seguindo";
        sprite_index = Larva_andando_2;
        image_index = 0;
        image_speed = 0.5;
    }
}

// --- Estado Seguindo ---
else if (larva_estado == "seguindo") {
    // Virar para o jogador
    if (obj_player.x > x) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }

    contador_passos += 1;
    if (contador_passos >= intervalo_passos) {
        contador_passos = 0;

        // Direção para o jogador
        var dir = point_direction(x, y, obj_player.x, obj_player.y);

        // Tenta andar direto nessa direção
        var new_x = x + lengthdir_x(velocidade, dir);
        var new_y = y + lengthdir_y(velocidade, dir);

        // Verifica colisão com tiles ou objetos colisor
        if (!place_meeting(new_x, new_y, obj_colisor_inimigos) 
        && !place_meeting(new_x, new_y, tiles) 
        && !place_meeting(new_x, new_y, colisivo)) {
            x = new_x;
            y = new_y;
        } else {
            // Se tem colisão, tenta desviar
            var desvio_angulo;
            var tentou_andar = false;
            var angulos_desvio = [30, -30, 60, -60, 90, -90];

            for (var i = 0; i < array_length(angulos_desvio); i++) {
                desvio_angulo = dir + angulos_desvio[i];
                new_x = x + lengthdir_x(velocidade, desvio_angulo);
                new_y = y + lengthdir_y(velocidade, desvio_angulo);

                if (!place_meeting(new_x, new_y, obj_colisor_inimigos) 
                && !place_meeting(new_x, new_y, tiles) 
                && !place_meeting(new_x, new_y, colisivo)) {
                    x = new_x;
                    y = new_y;
                    tentou_andar = true;
                    break;
                }
            }

            // Se não conseguiu desviar, fica parado
            if (!tentou_andar) {
                // opcional: lógica extra
            }
        }

        // Se colidiu com o jogador, causa dano
        if (place_meeting(x, y, obj_hitbox_inimigos)) {
            with (obj_player) {
                receber_dano(other);
            }
        }
    }
}