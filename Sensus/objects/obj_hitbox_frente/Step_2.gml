// --- Step Event ---

// Segue o jogador
x = obj_player.x;
y = obj_player.y;

// Reflexão horizontal

image_xscale = (mouse_x < x) ? -1 : 1;

// Tilemaps
var tile     = layer_tilemap_get_id("Tiles_Parede_Cantos");
var colisivo = layer_tilemap_get_id("Tiles_Colisor");

// Reset flags
obj_player.colide_atras  = false;
obj_player.colide_cima   = false;
obj_player.colide_baixo  = false;
obj_player.colide_frente = false;
obj_player.objeto_colidido_frente = noone;

var pos_atras_x = x - 4 * image_xscale;

if (place_meeting(pos_atras_x, y, [tile, obj_colissor_adicional])) {
    obj_player.colide_atras = true;
}

// Colisão acima
if (place_meeting(x, y - 1, [tile, obj_colissor_adicional])) {
    obj_player.colide_cima = true;
}

// Colisão abaixo
if (place_meeting(x, y + 1, [tile, obj_colissor_adicional])) {
    obj_player.colide_baixo = true;
}

// Colisão na frente
// Se a hitbox está colidindo, empurra o jogador para trás

var direcao_frontal = image_xscale; // 1 para direita, -1 para esquerda
var pos_frontal_x = obj_player.x + direcao_frontal;

// Verifica colisão
if (place_meeting(pos_frontal_x + image_xscale, y, [tile, obj_colissor_adicional])) {
    obj_player.colide_frente = true;

    var deslocamento = -direcao_frontal; // Move para trás da direção atual
    var passos = 0;

    // Enquanto estiver colidindo à frente, empurra o jogador
    while (place_meeting(obj_player.x + direcao_frontal, y, [tile, obj_colissor_adicional]) && passos < 10) {
        obj_player.x += deslocamento;
        passos += 1;
    }

    obj_player.objeto_colidido_frente = instance_place(obj_player.x + direcao_frontal, y, [tile, obj_colissor_adicional]);
}