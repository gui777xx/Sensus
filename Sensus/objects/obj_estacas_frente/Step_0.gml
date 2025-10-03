// Subindo
if (image_speed > 0 && image_index >= image_number - 1) {
    image_speed = 0;
    image_index = image_number - 1;
}

// Descendo
if (image_speed < 0 && image_index <= 0) {
    image_speed = 0;
    image_index = 0;
}

// Controle de colisão com base na posição da estaca
if (image_index <= 0) {
    mask_index = Vazio; // Sem colisão
} else {
    mask_index = Estacas_frente; // Ou o sprite que define a colisão
}