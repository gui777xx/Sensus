// obj_boss - Step Event
var dist = point_distance(x, y, obj_player.x, obj_player.y);

// Se o jogador se aproxima e o boss ainda não está em alerta
if (dist < distancia_alerta && !alerta && !animando_alerta) {
    alerta = true;
    animando_alerta = true;
    sprite_index = Boss_alerta;
    image_index = 0;
    image_speed = 1;

    // trava o jogador durante a animação
    obj_player.congelado = true;
}

// Se terminou a animação de alerta
if (animando_alerta) {
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        animando_alerta = false;
        image_speed = 1;

        // libera o jogador
        obj_player.congelado = false;

        // volta para sprite parado
        sprite_index = Boss_parado;
    }
}