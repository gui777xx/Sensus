draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Fundo do botão
if (hover) {
    draw_set_color(c_gray); // cor quando mouse está em cima
} else {
    draw_set_color(c_dkgray); // cor normal
}

draw_rectangle(x - button_width / 2, y - button_height / 2,
               x + button_width / 2, y + button_height / 2, false);

// Texto
draw_set_color(c_white);
draw_set_font(fnt_botao);
draw_text(x, y, button_text);

// Reset
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
