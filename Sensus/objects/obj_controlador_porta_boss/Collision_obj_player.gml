// ============================================================================
// Obj_controlador_porta_boss - EVENTO COLLISION com Obj_player
// ============================================================================

// 1. Encontra a instância do boss na sala
var boss = instance_find(obj_boss, 0);

// 2. Verifica se o boss existe e se ainda não está em alerta
if (instance_exists(boss) && boss.estado == "idle") {
    
    // 3. Ativa o estado de alerta no boss
    boss.alerta = true;
    boss.animando_alerta = true;
    boss.sprite_index = Boss_alerta;
    boss.image_index = 0;
    boss.image_speed = 1;

    // >>> Ativa a barra de HP do boss <<<
    boss.barra_ativada = true;
    
    // 4. Congela o jogador (se necessário)
    other.congelado = true; // 'other' refere-se ao Obj_player na colisão
    
    // 5. Destrói o controlador para que o alerta não seja reativado
    instance_destroy();
}