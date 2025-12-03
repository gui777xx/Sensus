// Só reage se não estiver invulnerável, não estiver já em dano/morrendo
if (!invulneravel && besouro_estado != "dano" && besouro_estado != "morrendo") {
    // Entra no estado de dano
    besouro_estado = "dano";
    sprite_index = besouro_dano;
    image_index = 0;
    image_speed = 1;

    // i-frames
    invulneravel = true;
    invulneravel_timer = invulneravel_timer_padrao;

    // Knockback sempre na direção oposta ao player
    knockback_dir   = point_direction(obj_player.x, obj_player.y, x, y);
    knockback_vel   = knockback_forca;
    knockback_timer = knockback_max;
}