// Desenha sprite do botão
if (hover) {
    draw_sprite(button_sprite, 1, x, y); // frame 1 = hover
} else {
    draw_sprite(button_sprite, 0, x, y); // frame 0 = normal
}

