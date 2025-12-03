if (using_main) {
    // Travar no último frame da splash principal
    if (image_index >= sprite_get_number(main_splash) - 1) {
        image_index = sprite_get_number(main_splash) - 1;
        image_speed = 0;
        using_main = false; // terminou a principal, agora mistura alternativas
    }
} else {
    // Timer para trocar sprites alternativas
    swap_timer += 1;

    if (swap_timer >= swap_interval) {
        swap_timer = 0;

        // Escolhe aleatoriamente uma splash alternativa
        var new_sprite = splash_sprites[irandom(array_length(splash_sprites) - 1)];
        sprite_index = new_sprite;
        image_index = 0;
        image_speed = 0.5;
    }

    // Travar no último frame de cada alternativa
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        image_index = sprite_get_number(sprite_index) - 1;
        image_speed = 0;
    }
}
