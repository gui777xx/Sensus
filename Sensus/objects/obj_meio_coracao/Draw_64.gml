var largura = display_get_gui_width();
var altura  = display_get_gui_height();
var margem  = 20;

// Se o texto 3 estiver ativo, ele tem prioridade e aparece sozinho
if (mostrar_texto_3) {
    var xx3 = largura - sprite_get_width(Sprite_texto_3)*2 - margem;
    var yy3 = altura  - sprite_get_height(Sprite_texto_3)*2 - margem;
    draw_sprite_ext(Sprite_texto_3, 0, xx3, yy3, 2, 2, 0, c_white, 1);
}
// Senão, se encostando, mostra o texto 2
else if (mostrar_texto_2) {
    var xx2 = largura - sprite_get_width(Sprite_texto_2)*2 - margem;
    var yy2 = altura  - sprite_get_height(Sprite_texto_2)*2 - margem;
    draw_sprite_ext(Sprite_texto_2, 0, xx2, yy2, 2, 2, 0, c_white, 1);
}