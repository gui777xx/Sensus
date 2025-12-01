if (!inimigos_summonados && instance_number(obj_larva_pai) == 0) {
    
    inimigos_summonados = true;

    // Cria os inimigos da próxima sala
    instance_create_layer(1100, 711, "Ins_Entidades", obj_besouro);
    instance_create_layer(1164, 690, "Ins_Entidades", obj_larva);
    instance_create_layer(1155, 720, "Ins_Entidades", obj_lesma);

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
    var novo_controlador = instance_create_layer(1034, 631, "Controladores", obj_controlador_5);
    novo_controlador.image_xscale = 2.8;
    novo_controlador.image_yscale = 1.9;

    // Destroi o controlador atual
    instance_destroy();
}