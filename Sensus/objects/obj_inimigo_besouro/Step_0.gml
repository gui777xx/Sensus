
// Acordando
if (besouro_estado == "parado") {
    // Virar para o jogador
    if (obj_player.x > x) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }

    if (image_index >= image_number - 1) {
        besouro_estado = "seguindo";
        sprite_index = besouro_andando;
    }
}

// Seguindo
else if (besouro_estado == "seguindo") {
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
        if (!place_meeting(new_x, new_y, obj_colisor_inimigos) && !place_meeting(new_x, new_y, tiles) && !place_meeting(new_x, new_y, colisivo)) {
            x = new_x;
            y = new_y;
        } else {
            // Se tem colisão, tenta desviar

            // Tenta ângulos alternativos para desviar: 30°, -30°, 60°, -60°, 90°, -90°
            var desvio_angulo;
            var tentou_andar = false;
            var angulos_desvio = [30, -30, 60, -60, 90, -90];

            for (var i = 0; i < array_length(angulos_desvio); i++) {
                desvio_angulo = dir + angulos_desvio[i];
                new_x = x + lengthdir_x(velocidade, desvio_angulo);
                new_y = y + lengthdir_y(velocidade, desvio_angulo);
                if (!place_meeting(new_x, new_y, obj_colisor_inimigos) && !place_meeting(new_x, new_y, tiles) && !place_meeting(new_x, new_y, colisivo)) {
                    x = new_x;
                    y = new_y;
                    tentou_andar = true;
                    break;
                }
            }

            // Se não conseguiu desviar, não anda
            if (!tentou_andar) {
                // opcional: fica parado ou tenta outra lógica
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