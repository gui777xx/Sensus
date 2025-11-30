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
distancia_ataque_min = 60;
distancia_ataque_max = 100;
distancia_ataque     = irandom_range(distancia_ataque_min, distancia_ataque_max);

// Ataque
ataque_velocidade   = 10;     // velocidade normal do dash
ataque_tempo        = 0;      
ataque_dir          = 0;      
frame_inicio_dash   = 10;     // frame em que começa o dash
ataque_fase         = "";     // <<< inicializado aqui

// Burst variável
burst_min = 12;               
burst_max = 18;               

// Cooldown de ataque
ataque_cooldown     = 0;        
ataque_cooldown_max = 65;   

// Controle de combo
ataque_combo = false; // se vai engatar segundo dash

// Controle de morte
alpha_morte = 3;

// Tilemaps de colisão
tiles    = layer_tilemap_get_id("Tiles_Parede_Cantos");
colisivo = layer_tilemap_get_id("Tiles_Colisor");