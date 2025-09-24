// Dormindo
if (larva_estado == "dormindo") {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist < distancia_ativacao) {
        larva_estado = "acordando";
        sprite_index = Larva_acordando;
        image_index = 0;
    }
}

// Acordando
else if (larva_estado == "acordando") {
    // Virar para o jogador
    if (obj_player.x > x) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }

    if (image_index >= image_number - 1) {
        larva_estado = "seguindo";
        sprite_index = Larva_andando;
    }
}

// Seguindo
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
        var dir = point_direction(x, y, obj_player.x, obj_player.y);
        x += lengthdir_x(velocidade, dir);
        y += lengthdir_y(velocidade, dir);

        if (place_meeting(x, y, obj_hitbox_inimigos)) {
            with (obj_player) {
                receber_dano(other); 
            }
        }
    }
}