if (!inimigos_summonados && instance_number(obj_larva_pai) == 0) {
    
    inimigos_summonados = true;

    // Cria os inimigos da próxima sala
    instance_create_layer(817, 565, "Ins_Entidades", obj_besouro_1);
    instance_create_layer(780, 590, "Ins_Entidades", obj_larva_1);
    instance_create_layer(815, 606, "Ins_Entidades", obj_larva_1);
	 instance_create_layer(868, 548, "Ins_Entidades", obj_besouro_1);

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
    var novo_controlador = instance_create_layer(734, 489, "Controladores", obj_controlador_B_3);
    novo_controlador.image_xscale = 2.5;
    novo_controlador.image_yscale = 2.3;

    // Destroi o controlador atual
    instance_destroy();
}