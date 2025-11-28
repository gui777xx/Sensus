// Recebe dano do slash
if (place_meeting(x, y, obj_slash)) {
    besouro_estado = "morrendo";
    sprite_index = besouro_morrendo;
    image_index = 0;
    image_speed = 0.5; // velocidade da animação de morte
}

// Estado de morte
if (besouro_estado == "morrendo") {
    if (image_index >= image_number - 1) {
        image_speed = 0;
        alpha_morte -= 0.05;
        image_alpha = alpha_morte;
        if (alpha_morte <= 0.05) {
            instance_destroy();
        }
    }
}
