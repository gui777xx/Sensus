// ============================================================================
// obj_boss - CREATE EVENT (FINAL CONSOLIDADO COM MORTE)
// ============================================================================

sprite_index = Boss_parado;
image_speed = 1;

// NOVO SISTEMA DE VIDA (Contagem de Hits)
vida_max = 40; // Total de hits que o boss pode levar
vida = 0;      // Hits que o boss já levou (começa em 0)
invulneravel = false; // Controle de invulnerabilidade

// Controle de alerta
alerta = false; // Controla se o alerta já foi ativado
animando_alerta = false;

// Estados e ataques
// ESTADOS: "idle", "atacando", "cooldown"
estado = "idle"; // Estado inicial, esperando a ativação
// ATAQUE_ATUAL: 0 = Teleporte, 1 = Veneno, 2 = Melee
ataque_atual = -1; 
veneno_spawnado = false;

// Rastreia o último ataque usado e a contagem de repetições
last_attack = -1; 
repeat_count = 0; // Conta quantas vezes o ataque atual foi repetido (máx 1)

// NOVO: Estado de Morte
morrendo = false; 

// Posições para teleporte (ATUALIZADAS)
posicoes = [
    [334, 100],
    [307, 122],
    [294, 86],
    [391, 71],
    [374, 120],
	[346, 134],
	[343, 77]
];

// Garante sorteio aleatório
randomize(); 