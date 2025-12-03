if (!inimigos_summonados && instance_number(obj_larva_pai) == 0) {
    
    inimigos_summonados = true;

    // Cria os inimigos da próxima sala
    instance_create_layer(560, 516, "Ins_Entidades", obj_besouro_1);
    instance_create_layer(638, 535, "Ins_Entidades", obj_larva_1);

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
    var novo_controlador = instance_create_layer(520, 460, "Controladores", obj_controlador_B_2);
    novo_controlador.image_xscale = 2.3;
    novo_controlador.image_yscale = 2.2;

    // Destroi o controlador atual
    instance_destroy();
}