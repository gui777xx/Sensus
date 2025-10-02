if (alpha_fading) {
    image_alpha -= 0.02; // Diminui gradualmente

    if (image_alpha <= 0) {
        instance_destroy(); // Some completamente
    }
}