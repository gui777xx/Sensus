//variaveis comuns de todos os inimigos

//Iniciando os estados padrão de todos os inimigos

estado_parado		= new estado();
estado_andando		= new estado();
estado_dano			= new estado();
estado_morrendo		= new estado();
estado_atacando		= new estado();

//iniciando o estado parado por padrão 
inicia_estado(estado_parado);
 tiles     = layer_tilemap_get_id("Tiles_Parede_Cantos");
 colisivo = layer_tilemap_get_id("Tiles_Colisor");