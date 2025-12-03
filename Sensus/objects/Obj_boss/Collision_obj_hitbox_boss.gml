// ============================================================================
// Obj_boss - EVENTO COLLISION com obj_hitbox_frente (FINAL CONSOLIDADO)
// ============================================================================

// Lógica para o ataque de Teleporte (Boss_saindo_terra)
if (sprite_index == Boss_saindo_terra) {
    
    // Verifica se o frame atual está entre 8 e 14 (janela de dano)
    if (image_index >= 8 && image_index <= 14) {
        
        with (obj_player) {
            // 'other' aqui se refere ao Obj_boss que está executando o código
            receber_dano(other); 
        }
    }
}

// Lógica para o novo ataque Melee
else if (sprite_index == Boss_ataque_melee_1) {
    
    // Verifica se o frame atual está entre 10 e 14 (janela de dano)
    if (image_index >= 10 && image_index <= 14) {
        
        with (obj_player) {
            // 'other' aqui se refere ao Obj_boss que está executando o código
            receber_dano(other); 
        }
    }
}