// CREATE EVENT
larva_estado = "dormindo";
global.larvas_alerta = false;
sprite_index = lesma_dormindo;
velocidade = 1;
distancia_ativacao = 40;
contador_passos = 2;
intervalo_passos = 4; // controla a velocidade (quanto maior, mais lenta)
alpha_morte = 1;
hp = 2;

ataque_distancia_range = 120; // distância para ataque à distância

// Flag para controlar o disparo no frame 8 do ataque
atacou_frame11 = false;

gosma_speed = 1;

tiles     = layer_tilemap_get_id("Tiles_Parede_Cantos");
colisivo  = layer_tilemap_get_id("Tiles_Colisor");