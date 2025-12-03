// Verifica se está colidindo com algum obj_controlador_pai
if (place_meeting(x, y, obj_controlador_pai)) {
    // Verifica se não existem instâncias de obj_larva_pai
    if (instance_number(obj_boss) == 0) {
        // Cria a barreira quebrando na mesma posição
        instance_create_layer(x + 3, y, "Ins_Entidades", obj_barreira_quebrando_direita);
        
        // Destroi a barreira atual
        instance_destroy();
    }
}