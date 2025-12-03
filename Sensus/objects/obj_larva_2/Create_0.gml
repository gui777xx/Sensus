// Estado inicial
larva_estado = "surgindo";
global.larvas_alerta = false;

// Sprite inicial de surgimento
sprite_index = Larva_surgindo_2;
image_index = 0;
image_speed = 0.5; // velocidade da animação de surgimento

// Configurações gerais
velocidade = 1;
distancia_ativacao = 40; // não será usado, mas mantido por compatibilidade
contador_passos = 0;
intervalo_passos = 7;
alpha_morte = 1; // controle de transparência

// Tiles de colisão
tiles     = layer_tilemap_get_id("Tiles_Parede_Cantos");
colisivo  = layer_tilemap_get_id("Tiles_Colisor");