// Travar no topo
if (image_speed > 0 && image_index >= image_number - 1) {
    image_speed = 0;
    image_index = image_number - 1;
}

// Travar na base
if (image_speed < 0 && image_index <= 0) {
    image_speed = 0;
    image_index = 0;
}

// Colisão: qualquer frame acima de 0 já bloqueia
if (image_index <= 0) {
    mask_index = Vazio;             // sem colisão quando totalmente abaixada
} else {
    mask_index = Estacas_frente;  // colisão durante a subida e no topo
}