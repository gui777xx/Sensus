// Dentro de qualquer objeto (como jogador ou larva), você pode fazer:
with (obj_controlador_porta) {
    if (porta_fechada && instance_number(obj_larva_pai) == 0) {
        porta_fechada = false;

        // Estacas descem
        with (obj_estacas_frente) {
            image_speed = -1;
        }
        with (obj_estacas_direita) {
            image_speed = -1;
        }
        with (obj_estacas_esquerda) {
            image_speed = -1;
        }
    }
}