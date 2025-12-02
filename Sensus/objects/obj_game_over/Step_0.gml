if (fade_alpha < 1) {
    fade_alpha += fade_speed;
} else if (!botao_criado) {
    var cx = room_width / 2;
    var cy = room_height * 0.75;

    instance_create_layer(cx - 120, cy, "Instances", obj_restart_button);
    instance_create_layer(cx + 120, cy, "Instances", obj_quit_button);

    botao_criado = true;
}