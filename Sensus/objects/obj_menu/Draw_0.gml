// Splash principal ou atual
draw_sprite_stretched(sprite_index, image_index, 0, 0, room_width, room_height);

// Mistura das alternativas
if (!using_main) {
    for (var i = 0; i < array_length(splash_sprites); i++) {
        var spr = splash_sprites[i];
        draw_sprite_stretched(spr, image_index, 0, 0, room_width, room_height);
    }
    draw_set_alpha(1); // reset
}
