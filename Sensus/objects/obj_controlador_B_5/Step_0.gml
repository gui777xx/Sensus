if (!inimigos_summonados && instance_number(obj_larva_pai) == 0) {
    
    inimigos_summonados = true;

    // Cria os inimigos da próxima sala
    instance_create_layer(1358, 691, "Ins_Entidades", obj_inimigo_escorpiao_1);

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
    var novo_controlador = instance_create_layer(1279, 620, "Controladores", obj_controlador_B_6);
    novo_controlador.image_xscale = 2.5;
    novo_controlador.image_yscale = 2.1;

    // Destroi o controlador atual
    instance_destroy();
}