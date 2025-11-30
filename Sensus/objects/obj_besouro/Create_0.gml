// Estado inicial
besouro_estado = "parado";
global.larvas_alerta = false;
sprite_index = besouro_parado;

// Movimento
velocidade = 2;
contador_passos = 0;
intervalo_passos = 5;

// Distâncias
distancia_ativacao   = 80;
distancia_seguir     = 200; // até onde anda atrás do player
distancia_ataque_min = 50;
distancia_ataque_max = 65;
distancia_ataque     = irandom_range(distancia_ataque_min, distancia_ataque_max);

// Ataque
ataque_velocidade   = 4;
ataque_tempo        = 0;
ataque_dir          = 0;
frame_inicio_dash   = 9;   // espera até o frame 9
ataque_fase         = "";

// Aleatoriedade do ângulo (desvio máximo em graus)
ataque_desvio_max = 3; // diminui a aleatoriedade do ângulo

// Cooldown de ataque
ataque_cooldown     = 0;
ataque_cooldown_max = 65;

// Vida e dano
hits_restantes = 3;      // 2 danos, no 3º morre

// Invulnerabilidade e controle de hit
invulneravel = false;
invulneravel_timer = 0;
invulneravel_timer_padrao = 10; // i-frames pós-dano
hit_lock = false;               // bloqueio de múltiplos disparos no mesmo step

// Morte
alpha_morte = 3;

// Tilemaps de colisão
tiles    = layer_tilemap_get_id("Tiles_Parede_Cantos");
colisivo = layer_tilemap_get_id("Tiles_Colisor");

// -------------------------------------------
// Funções de dano (definidas no próprio objeto)
// -------------------------------------------

function besouro_iniciar_dano(_source) {
    // Só inicia se estiver vivo, não em dano, e não invulnerável
    if (besouro_estado == "morrendo" || besouro_estado == "dano" || invulneravel) {
        return;
    }

    // Trava movimentação/ataque e ativa invulnerabilidade
    besouro_estado = "dano";
    sprite_index = besouro_dano;
    image_index = 0;
    image_speed = 1;

    invulneravel = true;
    invulneravel_timer = invulneravel_timer_padrao; // mantém invulnerável após a animação também
}

function besouro_finalizar_dano() {
    // Chamado ao final da animação de dano
    // Agora sim decrementa a vida
    hits_restantes -= 1;

    if (hits_restantes <= 0) {
        besouro_estado = "morrendo";
        sprite_index = besouro_morrendo;
        image_index = 0;
        image_speed = 0.5;
        invulneravel = false; // pode manter invulnerável se preferir, não é necessário
    } else {
        // Volta a seguir
        besouro_estado = "seguindo";
        sprite_index = besouro_andando;
        image_speed = 1;

        // Continua invulnerável até o timer zerar
        // (invulneravel_timer já foi setado na entrada do dano)
    }
}