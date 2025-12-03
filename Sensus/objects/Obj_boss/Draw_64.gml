// ============================================================================
// obj_boss - Draw GUI Event (AJUSTE DE BARRA DE VIDA)
// ============================================================================

// A barra de vida só é desenhada se o boss estiver em alerta E NÃO estiver morrendo
if (alerta && !morrendo) {
    var largura_sprite = sprite_get_width(Barra_vida);
    var altura_sprite  = sprite_get_height(Barra_vida);

    // fator de escala (mantém fixo)
    var escala_x = 2; 
    var escala_y = 1.5; 

    // calcula posição central inferior
    var largura_total = largura_sprite * escala_x;
    var altura_total  = altura_sprite * escala_y;

    var pos_x = (display_get_gui_width()/2) - (largura_total/2);
    var pos_y = display_get_gui_height() - altura_total + 50; 

    // Desenha o sprite da barra de vida no frame correspondente à vida atual
    // Nota: O sprite Barra_vida deve ter 41 frames (0 a 40)
    draw_sprite_ext(
        Barra_vida, 
        vida, // Usa 'vida' (hits levados) como image_index
        pos_x, pos_y,
        escala_x, escala_y, 
        0, // Rotação
        c_white, 1
    );
}