if (!inimigos_summonados && instance_number(obj_boss) == 0) {
    
    // Abre a porta
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

 
  
    // Destroi o controlador atual
    instance_destroy();
}