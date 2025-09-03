if (instance_exists(obj_player)) {
    if (obj_player.y < y) {
        depth = obj_player.depth - 1; // Mesa atrás do personagem
    } else {
        depth = obj_player.depth + 1 //Mesa à frente do personagem
    }
}

if (place_meeting(x, y, obj_slash))
{
instance_create_layer(x, y, "Ins_Cenario", obj_barril_quebrando_pedras);
instance_destroy(); // remove a caixa original
}