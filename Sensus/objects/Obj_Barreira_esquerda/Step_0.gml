// Verifica se está encostando no controlador
if (place_meeting(x, y, obj_controlador)) {
    
    // Acessa o controlador e verifica se todos os inimigos foram eliminados
    var controlador = instance_place(x, y, obj_controlador);
    
    if (controlador != noone) {
        if (controlador.porta_fechada == false && instance_number(obj_larva_pai) == 0) {
            
            // Salva posição e camada
            var x_pos = x;
            var y_pos = y;
            var layer_pos = layer;

            // Cria barreira quebrando e destrói a atual
            instance_create_layer(x_pos, y_pos, layer_pos, obj_barreira_quebrando_esquerda);
            instance_destroy();
        }
    }
}