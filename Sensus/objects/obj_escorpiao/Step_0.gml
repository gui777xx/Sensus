var _player = obj_player;
if (instance_exists(_player))
{
    move_towards_point(_player.x, _player.y, 2); // 2 é a velocidade, você pode ajustar
}
if (hspeed != 0 || vspeed != 0)
{
    if (hspeed < 0) // Virando para a esquerda
    {
        sprite_index = escopiao_andando;
        image_xscale = -1; // Inverte o sprite horizontalmente
    }
    else if (hspeed > 0) // Virando para a direita
    {
        sprite_index = escopiao_andando;
        image_xscale = 1; // Mantém o sprite normal
    }
}
else
{
    sprite_index = escopiao_parado;
}
if (speed == 0)
{
    if (irandom(100) < 5) // 5% de chance de mudar de direção
    {
        direction = irandom(360);
        speed = 0.5; // Pequena velocidade para o movimento ocioso
    }
}