// Step Event do obj_controlador_corda
var player = instance_place(x, y, obj_player);

if (player != noone) {
    // Se o jogador apertar E
    if (keyboard_check_pressed(ord("E"))) {
        player.estar = "descendo";
        player.x = 1363;
        player.y = 553;
        player.Vel = 0;
    }

    // Enquanto o estado for "descendo", força o sprite
    if (player.estar == "descendo") {
        player.sprite_index = Player_descendo;
        player.image_speed  = 1; // anima normalmente
    }
}