var jogador = instance_place(x, y, obj_player); // Substitua Obj_Player pelo nome correto

if (jogador != noone && !jogador.caindo_no_buraco && !jogador.Imune) {
    // Centraliza o jogador no centro do buraco
    jogador.x = x;
    jogador.y = y;

    // Inicia a queda
    jogador.caindo_no_buraco = true;
    jogador.sprite_index = Player_caindo;
    jogador.image_index = 0;

    var duracao_caindo = sprite_get_number(Player_caindo) / sprite_get_speed(Player_caindo);
    jogador.tempo_caindo = current_time + duracao_caindo * 1000;
}