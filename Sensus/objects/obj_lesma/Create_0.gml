// CREATE EVENT
larva_estado = "dormindo";
global.larvas_alerta = false;
sprite_index = lesma_dormindo;

velocidade = 1;
distancia_ativacao = 40;
contador_passos = 2;
intervalo_passos = 4; // quanto maior, mais lenta
alpha_morte = 1;
hp = 2;

ataque_distancia_range = 120; // distância para ataque à distância
atacou_frame11 = false;

gosma_speed = 1;

tiles     = layer_tilemap_get_id("Tiles_Parede_Cantos");
colisivo  = layer_tilemap_get_id("Tiles_Colisor");

// Controle de dano/invulnerabilidade
invulneravel = false;
invulneravel_timer = 0;
invulneravel_timer_padrao = 10; // i-frames pós-dano
hit_lock = false;               // impede múltiplos acertos enquanto sobreposto

// Knockback
knockback_dir   = 0;
knockback_vel   = 0;
knockback_timer = 0;
knockback_max   = 8;     // duração em steps
knockback_forca = 3.5;   // força inicial (ajuste ao seu gosto)
knockback_drag  = 0.85;  // desaceleração por step