// Estado inicial
besouro_estado = "parado";
global.larvas_alerta = false;
sprite_index = besouro_parado;

// Movimento
velocidade = 2;
contador_passos = 0;
intervalo_passos = 8;

// Distâncias
distancia_ativacao   = 50;
distancia_seguir     = 200;
distancia_ataque_min = 25;
distancia_ataque_max = 35;
distancia_ataque     = irandom_range(distancia_ataque_min, distancia_ataque_max);

// Ataque
ataque_velocidade   = 12;
ataque_tempo        = 0;
ataque_dir          = 0;
frame_inicio_dash   = 9;
ataque_fase         = "";
ataque_desvio_max   = 1;
ataque_cooldown     = 0;
ataque_cooldown_max = 65;

// Vida e dano
hits_restantes = 3;

// Invulnerabilidade / controle de hit
invulneravel = false;
invulneravel_timer = 0;
invulneravel_timer_padrao = 10; // i-frames pós-dano
hit_lock = false;               // não usado no Collision, mas útil se precisar

// Morte
alpha_morte = 3;

// Tilemaps de colisão
tiles    = layer_tilemap_get_id("Tiles_Parede_Cantos");
colisivo = layer_tilemap_get_id("Tiles_Colisor");

// Knockback
knockback_dir   = 0;
knockback_vel   = 0;
knockback_timer = 0;
knockback_max   = 8;     // duração em steps
knockback_forca = 4;     // força inicial
knockback_drag  = 0.85;  // desaceleração por step