// Estado inicial
besouro_estado = "parado";
global.larvas_alerta = false;
sprite_index = besouro_parado;

// Movimento
velocidade = 2;
contador_passos = 0;
intervalo_passos = 5;

// Distâncias
distancia_ativacao = 40;   // quando acorda
distancia_ataque   = 60;   // quando dá a cabeçada

// Ataque
ataque_velocidade = 6;     // velocidade do dash
ataque_tempo = 0;          // contador de frames do ataque
ataque_dir = 0;            // direção calculada no momento do ataque

// Cooldown de ataque
ataque_cooldown = 0;       // contador
ataque_cooldown_max = 45;  // tempo de espera entre ataques (em frames)

// Controle de morte
alpha_morte = 1;

// Tilemaps de colisão
tiles    = layer_tilemap_get_id("Tiles_Parede_Cantos");
colisivo = layer_tilemap_get_id("Tiles_Colisor");
