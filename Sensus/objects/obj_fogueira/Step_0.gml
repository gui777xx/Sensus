if (instance_exists(obj_player)) {
    if (obj_player.y < y) {
        depth = obj_player.depth - 1; // Mesa atrás do personagem
    } else {
        depth = obj_player.depth + 3 //Mesa à frente do personagem
    }
}