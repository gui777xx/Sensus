// Collision com jogador
if (!porta_fechada) {
    porta_fechada = true;

    if (!estacas_subiram) {
        // Aplica a ação a todos os objetos de estacas
        with (obj_estacas_frente) {
            image_speed = 1;
        }
        with (obj_estacas_direita) {
            image_speed = 1;
        }
        with (obj_estacas_esquerda) {
            image_speed = 1;
        }

        estacas_subiram = true;
    }
}