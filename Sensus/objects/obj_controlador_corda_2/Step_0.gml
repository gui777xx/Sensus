// Step Event do obj_controlador_corda_2
var player = instance_place(x, y, obj_player);

if (player != noone) {
    // Se o jogador apertar E
    if (keyboard_check_pressed(ord("E"))) {
        // Encerra o jogo imediatamente
        game_end();
    }
}