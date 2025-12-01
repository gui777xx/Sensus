// Só desenha se houver opacidade > 0
if (global.overlay_alpha > 0.01) {
    draw_set_alpha(global.overlay_alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);
}
