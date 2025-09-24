if (instance_exists(obj_player)) {
    if (obj_player.y < y) {
        depth = obj_player.depth - 2; 
    } else {
        depth = obj_player.depth + 1;
    }
}