// obj_boss - Draw GUI Event
if (alerta) {
    var largura_sprite = sprite_get_width(Barra_vida);
    var altura_sprite  = sprite_get_height(Barra_vida);

    // fator de escala (aumenta a barra)
    var escala_x = 2; // dobra a largura
    var escala_y = 1.5; // aumenta 50% a altura

    // calcula posição central inferior
    var largura_total = largura_sprite * escala_x;
    var altura_total  = altura_sprite * escala_y;

    var pos_x = (display_get_gui_width()/2) - (largura_total/2);
    var pos_y = display_get_gui_height() - altura_total + 45; // mais embaixo

    // calcula proporção da vida
    var proporcao = vida / vida_max;
    var largura_recorte = largura_sprite * proporcao;

    // desenha apenas a parte proporcional da barra, com escala
    draw_sprite_part_ext(
        Barra_vida, 0,
        0, 0, largura_recorte, altura_sprite, // recorte proporcional
        pos_x, pos_y,
        escala_x, escala_y, // aplica escala
        c_white, 1
    );
}