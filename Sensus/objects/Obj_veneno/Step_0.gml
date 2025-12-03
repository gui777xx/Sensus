// ============================================================================
// Obj_veneno - STEP EVENT (AJUSTADO)
// ============================================================================

// Verifica se atingiu a altura máxima
if (y <= altura_maxima) {
    
    // 1. Spawnar 12 Obj_veneno_1
    var i = 0;
    repeat (20) { // <--- MUDANÇA AQUI: de 8 para 12
        // Coordenadas de spawn aleatórias: X = 254 a 430 / Y = 0 a 25
        var spawn_x = irandom_range(254, 430);
        var spawn_y = irandom_range(-40, 25);
        
        // Instancia o Obj_veneno_1
        instance_create_layer(spawn_x, spawn_y, layer, Obj_veneno_1);
    }
    
    // 2. Destruir o Obj_veneno
    instance_destroy();
}