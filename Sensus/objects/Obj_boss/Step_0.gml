// ============================================================================
// obj_boss - STEP EVENT (FINAL CONSOLIDADO)
// ============================================================================

// -------------------- GERENCIAMENTO DE ANIMAÇÃO DE ALERTA --------------------
// A ativação do alerta é feita pelo Obj_controlador_porta_boss.
// Este bloco apenas gerencia a animação de alerta.

if (animando_alerta) {
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        animando_alerta = false;
        obj_player.congelado = false;
        
        // Transição imediata para o ataque após o alerta
        estado = "atacando";
        sprite_index = Boss_parado; // Volta para o sprite parado
        
// === LÓGICA DE INÍCIO DE ATAQUE DIRETA (COM PREVENÇÃO DE 3 REPETIÇÕES) ===
var new_attack; 
var must_change = (repeat_count >= 1); 

do { 
    new_attack = irandom(3); // <--- MUDANÇA AQUI: Sorteia entre 0, 1, 2 e 3
} until (!must_change || (new_attack != last_attack)); 

// Atualiza as variáveis de controle
if (new_attack == last_attack) {
    repeat_count += 1; // Repetiu
} else {
    repeat_count = 0; // Ataque diferente, reseta a contagem
}

ataque_atual = new_attack;
last_attack = new_attack; // ATUALIZA O ÚLTIMO ATAQUE

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
    veneno_spawnado = false; 
    
} else if (ataque_atual == 2) { 
    // Ataque 2: Melee
    sprite_index = Boss_ataque_melee_1;
    image_index = 0;
    image_speed = 1;
    
} else if (ataque_atual == 3) { // <--- NOVO ATAQUE: Larvas
    // Ataque 3: Larvas
    sprite_index = Boss_alerta; // <--- CORREÇÃO: Usa o sprite de alerta
    image_index = 0;
    image_speed = 1;
    
    // Ativa o alarme para invocar as larvas após o alerta
    // Duração do alarme deve ser igual à duração da animação de alerta
    var duracao_alerta = sprite_get_number(Boss_alerta) / image_speed;
    alarm_set(3, duracao_alerta); 
}

// =========================================
}
}