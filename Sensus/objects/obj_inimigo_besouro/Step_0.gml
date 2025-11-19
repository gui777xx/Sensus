// Evento Step do obj_inimigo_besouro

// -------------------------------------------------------------------
// ESTADO: Dormindo ("parado")
// -------------------------------------------------------------------
if (besouro_estado == "parado") {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    
    if (dist < distancia_ativacao) {
        // CORREÇÃO 1: Transiciona para o estado "acordando"
        besouro_estado = "acordando"; 
        
        // CORREÇÃO 2: Garante que o sprite de "acordando" seja o correto
        // Se besouro_parado for o sprite de acordar, mantenha.
        // Se houver um sprite específico, use-o aqui.
        sprite_index = besouro_alerta; 
        image_index = 0;
        
        // Como removemos o 'else' nos blocos abaixo, a lógica de "acordando"
        // será executada neste mesmo frame, garantindo a transição imediata.
    }
}

// -------------------------------------------------------------------
// ESTADO: Acordando
// MUDANÇA CRUCIAL: Usa 'if' em vez de 'else if' para permitir a execução
// no mesmo frame da transição de "parado" para "acordando".
// -------------------------------------------------------------------
if (besouro_estado == "acordando") {
    // Virar para o jogador
    if (obj_player.x > x) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }

    // CORREÇÃO 3: Garante a transição para "seguindo" mesmo se o sprite for de 1 frame
    if (image_index >= image_number - 1) {
        // Se o sprite de "acordando" for de 1 frame, a transição ocorre imediatamente.
        // Se for animado, a transição ocorre no último frame.
		besouro_estado = "seguindo";
        sprite_index = besouro_andando;
    }
}

// -------------------------------------------------------------------
// ESTADO: Seguindo
// MUDANÇA CRUCIAL: Usa 'if' em vez de 'else if' para permitir a execução
// no mesmo frame da transição de "acordando" para "seguindo".
// -------------------------------------------------------------------
if (besouro_estado == "seguindo") {
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
    } // Fim do if (contador_passos)
} // Fim do else if (besouro_estado == "seguindo")
}