// ============================================================================
// Obj_boss - EVENTO COLLISION com obj_slash (AJUSTE DE DANO E MORTE)
// ============================================================================

// 1. Verifica se o boss NÃO está invulnerável E NÃO está morrendo
if (!invulneravel && !morrendo) {
    
    // 2. Aplica o dano (aumenta a contagem de hits)
    vida += 1;
    
    // 3. Ativa a invulnerabilidade
    invulneravel = true;
    alarm[0] = 60;  //room_speed=60
    
    // 4. Efeito visual de dano
    image_blend = c_red;
    
    // 5. Lógica de Morte
    if (vida >= vida_max) {
        // Chama a função de morte
        boss_morrer(); 
    }
}