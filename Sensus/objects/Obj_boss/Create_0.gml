// ============================================================================
// obj_boss - CREATE EVENT
// ============================================================================

sprite_index = Boss_parado;
image_speed = 1;
vida_max = 25;
vida = vida_max;

// Controle de alerta
alerta = false;
animando_alerta = false;
distancia_alerta = 50;

// Estados e ataques
estado = "idle";
ataque_atual = -1;
pode_atacar = false;
tempo_espera = 0;
veneno_spawnado = false;

// Posições para teleporte
posicoes = [
    [301, 82],
    [294, 136],
    [393, 90],
    [413, 123],
    [349, 102]
];
