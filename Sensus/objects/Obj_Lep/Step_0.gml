var Tile = layer_tilemap_get_id("Tiles_Parede_Cantos")
var Colisivo = layer_tilemap_get_id("Tiles_Colisor")

// Atualiza o timer para mudar de direção
dir_timer -= 1;

if (dir_timer <= 0) {
    dir = irandom(4); // 0 = parado, 1 = cima, 2 = baixo, 3 = esquerda, 4 = direita
    dir_timer = irandom_range(30, 90);
}

// Define movimento
switch (dir) {
    case 0: // parado
        hsp = 0;
        vsp = 0;
        break;
    case 1: // cima
        hsp = 0;
        vsp = -spd;
        break;
    case 2: // baixo
        hsp = 0;
        vsp = spd;
        break;
    case 3: // esquerda
        hsp = -spd;
        vsp = 0;
        break;
    case 4: // direita
        hsp = spd;
        vsp = 0;
        break;
}

// Movimento final
x += hsp;
y += vsp;

// Troca de sprites conforme a direção
if (dir == 1) {
    sprite_index = rato_movimento_costa;
    image_speed = 1;
} else if (dir == 2) {
    sprite_index = rato_movimento_frente;
    image_speed = 1;
} else if (dir == 3) {
    sprite_index = rato_movimento_esquerda;
    image_speed = 1;
} else if (dir == 4) {
    sprite_index = rato_movimento_direita;
    image_speed = 1;
} else if (dir == 0){
	sprite_index = rato_parado_frente;
    image_speed = 0.2; // parado
}

if (!place_meeting(x, y + vsp,  [Tile, Colisor, Colisivo])) {
    x += hsp;
} else {
    hsp = 0;
    dir = 0; 
}

if (!place_meeting(x, y + vsp,  [Tile, Colisor, Colisivo])) {
    y += vsp;
} else {
    vsp = 0;
    dir = 0; 
}
