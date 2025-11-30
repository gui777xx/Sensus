// Se ainda não congelou, deixa a animação rodar
if (!congelado) {
    if (image_index >= image_number - 1) {
        // Congela no último frame
        image_index = image_number - 1;
        image_speed = 0;
        congelado = true;
    }
}

// Movimento: já usa direction + speed definidos pela lesma
// (GameMaker move automaticamente com essas variáveis)

// Colisão com paredes/colisor → destruir
if (place_meeting(x, y, [tile, colisivo, colisor])) {
    instance_destroy();
}

// Colisão com jogador → causar dano e destruir
if (place_meeting(x, y, obj_hitbox_inimigos)) {
    with (obj_player) {
        receber_dano(other);
    }
    instance_destroy();
}