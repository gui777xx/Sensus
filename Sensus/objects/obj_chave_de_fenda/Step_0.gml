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