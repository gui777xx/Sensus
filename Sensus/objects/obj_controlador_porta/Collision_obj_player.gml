// Collision com jogador
if (!porta_fechada) {
    porta_fechada = true;

    if (!estacas_subiram) {
        with (obj_estacas_frente) {
            image_speed = 1;
        }
        estacas_subiram = true;
    }
}