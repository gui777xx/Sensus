// Verifica se a animação terminou
if (!animacao_finalizada) {
    if (image_index >= image_number - 1) {
        animacao_finalizada = true;
        image_speed = 0; // Para a animação
    }
} else {
    // Começa a reduzir o alpha
    alpha_fade -= fade_speed;
    if (alpha_fade <= 0) {
        instance_destroy(); // Destroi o objeto
    }
}

// Aplica o alpha
image_alpha = alpha_fade;

// Verifica se ainda está nos frames com colisão
if (image_index <= 20) {
    mask_index = Barreira_quebrando_direita; // ou o sprite que tem a colisão
} else {
    mask_index = 0; // Remove a máscara de colisão
}

