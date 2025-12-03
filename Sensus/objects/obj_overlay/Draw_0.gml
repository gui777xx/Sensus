// Evento Draw do obj_overlay
if (global.overlay_alpha >= 1)  {
    // 1. Cobrir tudo com preto
    draw_set_alpha(global.overlay_alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);

    // 2. Redesenhar o player em branco
    if (instance_exists(obj_player)) {
        var p = obj_player;
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_sprite_ext(
            p.sprite_index,
            p.image_index,
            p.x,
            p.y,
            p.image_xscale,
            p.image_yscale,
            p.image_angle,
            c_white,
            1
        );
    }

    // 3. Redesenhar inimigos em branco (aparecem só no escuro)
    with (obj_larva_1) {
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
    }

    with (obj_besouro_1) {
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
    }

    with (obj_inimigo_escorpiao_1) {
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
    }

    with (obj_lesma_1) {
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
    }
	
	 with (obj_mira) {
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
    }

    // Resetar cor/alpha
    draw_set_alpha(1);
    draw_set_color(c_white);
}