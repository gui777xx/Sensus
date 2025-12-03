if (instance_exists(obj_player)) {
    if (obj_player.y + 5 < y) {
        depth = obj_player.depth - 1; 
    } else {
        depth = obj_player.depth + 1 
    }
}