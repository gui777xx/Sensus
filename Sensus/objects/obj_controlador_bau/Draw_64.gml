if (place_meeting(x, y, obj_player)) {
    var largura = display_get_gui_width();
    var altura  = display_get_gui_height();

    var margem = 20;
    var xx = largura - sprite_get_width(Sprite_texto)*2 - margem;
    var yy = altura - sprite_get_height(Sprite_texto)*2 - margem;

    // desenha o sprite com escala 2x
    draw_sprite_ext(Sprite_texto, 0, xx, yy, 2, 2, 0, c_white, 1);
}if (place_meeting(x, y, obj_player)) {
    var largura = display_get_gui_width();
    var altura  = display_get_gui_height();

    var margem = 20;
    var xx = largura - sprite_get_width(Sprite_texto)*2 - margem;
    var yy = altura - sprite_get_height(Sprite_texto)*2 - margem;

    // desenha o sprite com escala 2x
    draw_sprite_ext(Sprite_texto, 0, xx, yy, 2, 2, 0, c_white, 1);
}