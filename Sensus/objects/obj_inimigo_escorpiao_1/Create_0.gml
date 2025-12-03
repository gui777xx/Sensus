// Estado inicial
escorpiao_estado = "parado";
global.larvas_alerta = false;
sprite_index = escorpiao_parado;

// Movimento
velocidade = 2;
contador_passos = 0;
intervalo_passos = 5;

// Distâncias
distancia_ativacao = 64;    
distancia_ataque = 20;      
distancia_ataque_distancia = 29; 

// Ataque (dash curto e direção travada)
ataque_velocidade = 1;      
ataque_dir_locked = 0;      
ataque_xscale_locked = 1;   
ataque_tempo = 0;
ataque_em_andamento = false;
ataque_frame_inicio = 5;
ataque_duracao = 1;         

// Cooldown de ataque
ataque_cooldown = 0;
ataque_cooldown_max = 30;

// Knockback ao levar hit
knockback_speed = 2;        
knockback_duration = 7;     
knockback_dir = 0;          
knockback_timer = 0;        

// Controle de morte
alpha_morte = 1;

// Tilemaps de colisão
tiles    = layer_tilemap_get_id("Tiles_Parede_Cantos");
colisivo = layer_tilemap_get_id("Tiles_Colisor");

// Controle de vida
escorpiao_hits = 0;
escorpiao_hits_max = 4;
escorpiao_invulneravel = false;

// Anti-multi-hit
dano_cooldown = 0;
dano_cooldown_max = 8;

gosma_criada = false;