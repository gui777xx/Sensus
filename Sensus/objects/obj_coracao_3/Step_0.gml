hp = global.Vida_jogador 

if (hp >= 6)
{
	image_speed = 0
}
else
{
if (hp >= 5 && hp < 6)
{
	if (image_index >= 9)
	{
	image_speed = 0
	image_index = 9
	}
	else {
		image_speed = 1
	}
}
else
{
	sprite_index = Dano_coracao
	if (image_index >= 19)
	{
	image_speed = 0
	image_index = 19
	}
	else {
	image_speed = 1
	}
	
}

}
	


