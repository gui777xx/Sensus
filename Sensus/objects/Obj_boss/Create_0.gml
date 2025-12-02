// obj_boss - Create Event
sprite_index = Boss_parado;   // sprite inicial
image_speed = 0;              // parado sem animar
vida_max = 25;
vida = vida_max;
alerta = false;
animando_alerta = false;      // controla se está na animação de alerta
distancia_alerta = 50;

// Estados
estado = "parado";       // pode ser: "parado", "alerta", "atacando", "espera"
ataque_atual = -1;       // qual ataque está sendo executado
pode_atacar = true;      // controle para não spammar ataques



estado = "idle";        // estados: "idle", "alerta", "atacando", "saindo", "espera"
ataque_atual = -1;
pode_atacar = false;    // só começa a atacar depois do alerta
tempo_espera = 0;

posicoes = [
    [301, 82],
    [294, 136],
    [393, 90],
    [413, 123],
    [349, 102]
];