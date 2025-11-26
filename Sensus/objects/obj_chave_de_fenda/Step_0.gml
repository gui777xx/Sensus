// Step Event do obj_chave_de_fenda
if (place_meeting(x, y, obj_player)) {
    if (keyboard_check_pressed(ord("E"))) {
        var p = obj_player
        if (p != noone) {
            p.tem_chave_inglesa = true;
            instance_destroy(); // destrói a chave
        }
    }
}

if (instance_exists(obj_player)) {
    if (obj_player.y - 3 < y) {
        depth = obj_player.depth - 2; // Mesa atrás do personagem
    } else {
        depth = obj_player.depth + 1; //Mesa à frente do personagem
    }
}