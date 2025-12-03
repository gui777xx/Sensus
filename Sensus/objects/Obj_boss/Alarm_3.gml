// ============================================================================
// Obj_boss - EVENTO ALARM 3 (INVOCAÇÃO DE LARVAS)
// ============================================================================

// 1. Invoca 3 larvas em posições aleatórias
repeat (2) {
    // Posições de spawn: X = 280 a 410, Y = 84 a 138
    var spawn_x = irandom_range(280, 410);
    var spawn_y = irandom_range(84, 138);
    
    instance_create_layer(spawn_x, spawn_y, layer, obj_larva_2);
}

// 2. Inicia o cooldown
estado = "cooldown";
// Cooldown para o ataque de invocação (exemplo: 1.5 segundos)
alarm_set(1, game_get_speed(gamespeed_fps) * 1.5); 