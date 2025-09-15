if (instance_exists(obj_player)) {
    if (obj_player.y < y) {
        depth = obj_player.depth - 1; 
    } else {
        depth = obj_player.depth + 3;
    }
}