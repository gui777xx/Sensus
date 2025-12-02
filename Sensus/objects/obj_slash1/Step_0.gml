// Só define o sprite uma vez
if (!sprite_definido) {
    var angulo_mouse = point_direction(player_x, player_y, mouse_x, mouse_y);
    show_debug_message("Ângulo: " + string(angulo_mouse));

    if (
        (angulo_mouse >= 342 || angulo_mouse < 36) ||      // frente
        (angulo_mouse >= 306 && angulo_mouse < 342) ||     // diagonal baixo
        (angulo_mouse >= 270 && angulo_mouse < 306) ||     // baixo
        (angulo_mouse >= 90 && angulo_mouse < 145)         // diagonal leve cima
    ) {
        sprite_index = Slash;
		mask_index = Slash_hitbox;
    } else {
        sprite_index = Slash_2;
		mask_index = Slash_2_hitbox
    }

    sprite_definido = true; // trava o sprite
}

// Destrói o objeto quando a animação termina
if (image_index >= image_number - 1) {
    instance_destroy();
}