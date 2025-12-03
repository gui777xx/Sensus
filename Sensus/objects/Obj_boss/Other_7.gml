// ============================================================================
// obj_boss - EVENTO ANIMATION END (FINAL CONSOLIDADO COM CORREÇÃO DE MORTE)
// ============================================================================

// Lógica de teleporte para o ataque 0 (Boss_furando_terra)
if (sprite_index == Boss_furando_terra) {
    // Terminou de furar terra → Teleporte e troca de sprite
    
    // Escolhe posição aleatória e teletransporta
    var pos = posicoes[irandom(array_length(posicoes) - 1)];
    x = pos[0];
    y = pos[1];
    
    // Troca para sprite saindo da terra
    sprite_index = Boss_saindo_terra;
    image_index = 0;
    image_speed = 1;
}

// Lógica de transição para cooldown após sair da terra (Boss_saindo_terra)
else if (sprite_index == Boss_saindo_terra) {
    // Terminou de sair da terra → Cooldown
    sprite_index = Boss_parado;
    image_speed = 1;
    estado = "cooldown";
    // Cooldown de 1 segundo
    alarm[1] = game_get_speed(gamespeed_fps) * 1; 
}

// Lógica de spawn e cooldown para o ataque 1 (Boss_ataque1)
else if (sprite_index == Boss_ataque1) {
    // 1. Garante o spawn do veneno no último frame
    if (!veneno_spawnado) {
        veneno_spawnado = true;
        var v = instance_create_layer(x, y, layer, Obj_veneno);
    }
    
    // 2. Entra em cooldown
    sprite_index = Boss_parado;
    image_speed = 1;
    estado = "cooldown";
    // Cooldown de 0.75 segundos
    alarm[1] = game_get_speed(gamespeed_fps) * 0.75; 
}

// Lógica de cooldown para o ataque 2 (Melee)
else if (sprite_index == Boss_ataque_melee_1) { 
    // Terminou o ataque Melee → Cooldown
    sprite_index = Boss_parado;
    image_speed = 1;
    estado = "cooldown";
    // Cooldown de 1 segundo
    alarm[1] = game_get_speed(gamespeed_fps) * 1; 
}

// Lógica de Morte (REMOVIDA)
// O código de destruição foi movido para o Alarm 2.