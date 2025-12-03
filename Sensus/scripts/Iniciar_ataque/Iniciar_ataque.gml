// ============================================================================
// SCRIPT: iniciar_ataque() (CORREÇÃO DE ESCOPO)
// ============================================================================
function iniciar_ataque() {
    // Garante que o estado é "atacando" antes de iniciar
    if (estado != "atacando") return; 
    
    // **MUITO IMPORTANTE:** Remova a palavra-chave 'var' daqui!
    ataque_atual = irandom(1); // 0 = Teleporte, 1 = Veneno
    
    if (ataque_atual == 0) {
        // Ataque 0: Teleporte (Furando Terra)
        sprite_index = Boss_furando_terra;
        image_index = 0;
        image_speed = 1;
        
    } else if (ataque_atual == 1) {
        // Ataque 1: Veneno
        sprite_index = Boss_ataque1;
        image_index = 0;
        image_speed = 1;
        veneno_spawnado = false; // Reseta a flag para o novo ataque
    }
}