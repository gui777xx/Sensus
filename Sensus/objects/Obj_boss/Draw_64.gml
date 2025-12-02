// obj_boss - Draw GUI Event
if (alerta) {
    var largura_sprite = sprite_get_width(Barra_vida);
    var altura_sprite  = sprite_get_height(Barra_vida);

    var pos_x = (display_get_gui_width()/2) - (largura_sprite/2);
    var pos_y = display_get_gui_height() - altura_sprite - 20;

    // calcula proporção da vida
    var proporcao = vida / vida_max;
    var largura_recorte = largura_sprite * proporcao;

    // desenha apenas a parte proporcional da barra
    draw_sprite_part(
        Barra_vida, 0,
        0, 0, largura_recorte, altura_sprite,
        pos_x, pos_y
    );
}
