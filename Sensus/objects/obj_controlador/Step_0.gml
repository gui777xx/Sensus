if (porta_fechada && instance_number(obj_larva_pai) == 0) {
    // Estacas descem
    with (obj_estacas_frente) {
        image_speed = -1;
    }

    // Reabrir porta
    porta_fechada = false;
}

with (obj_controlador_porta) {
    if (porta_fechada && instance_number(obj_larva_pai) == 0) {
        porta_fechada = false;

        with (obj_estacas_frente) {
            image_speed = -1;
        }
    }
}

