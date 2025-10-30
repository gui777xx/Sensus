// Verifica se está encostando no controlador
if (place_meeting(x, y, obj_controlador_1)) {
    
    var controlador = instance_place(x, y, obj_controlador_1);
    
    if (controlador != noone) {
        // Verifica se a porta está aberta e se não há inimigos vivos
        if (controlador.porta_fechada == false && instance_number(obj_larva_pai) == 0 && !inimigos_summonados) {
            
            // Marca que já summonou os inimigos
            inimigos_summonados = true;

            // Cria os inimigos da próxima sala
            instance_create_layer(560, 516, "Ins_Entidades", obj_larva);
            instance_create_layer(585, 573, "Ins_Entidades", obj_larva);
            instance_create_layer(638, 535, "Ins_Entidades", obj_larva);

            // (Opcional) Destrói o sumonador após uso
            // instance_destroy();
        }
    }
}