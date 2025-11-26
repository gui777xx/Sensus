larva_estado = "dormindo";
global.larvas_alerta = false;
sprite_index = besouro_parado;
velocidade = 1;
distancia_ativacao = 40;
contador_passos = 0;
intervalo_passos = 5;
alpha_morte = 1; // controle de transparência

 tiles     = layer_tilemap_get_id("Tiles_Parede_Cantos");
 colisivo = layer_tilemap_get_id("Tiles_Colisor");