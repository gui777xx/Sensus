if (!inimigos_summonados && instance_number(obj_larva_pai) == 0) {
    
    inimigos_summonados = true;

    // Cria os inimigos da próxima sala
    instance_create_layer(1032, 499, "Ins_Entidades", obj_larva);
    instance_create_layer(1111, 500, "Ins_Entidades", obj_larva);
    instance_create_layer(1203, 498, "Ins_Entidades", obj_larva);

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

    // Cria o novo controlador
    var novo_controlador = instance_create_layer(974, 440, "Controladores", obj_controlador_4);
    novo_controlador.image_xscale = 4.4;
    novo_controlador.image_yscale = 2.3;

    // Destroi o controlador atual
    instance_destroy();
}