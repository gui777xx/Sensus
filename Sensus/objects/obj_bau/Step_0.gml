if (instance_exists(obj_player)) {
    if (obj_player.y + 1 < y) {
        depth = obj_player.depth - 1; // Mesa atrás do personagem
    } else {
        depth = obj_player.depth + 1 //Mesa à frente do personagem
    }
}

function abrir() {
    aberto = true;
    animando = true;
    sprite_index = Bau_abrindo;
    image_index = 0;
    image_speed = 1;
}

if (animando) {
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        image_speed = 0;
        animando = false;
        image_index = sprite_get_number(sprite_index) - 1; // trava no último frame
		instance_create_layer(x, y + 6, "ins_Entidades", obj_meio_coracao);
    }
}

