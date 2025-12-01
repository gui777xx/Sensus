/// @description Draw Event for obj_restart_button

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Cor de fundo do botão (muda ao passar o mouse)
if (hover)
{
    draw_set_color(c_gray); 
}
else
{
    draw_set_color(c_dkgray); 
}

// Desenha o retângulo do botão
draw_rectangle(x - button_width / 2, y - button_height / 2, 
               x + button_width / 2, y + button_height / 2, false);

// Desenha o texto
draw_set_color(c_white);
draw_text(x, y, button_text);

// Reseta as configurações
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
