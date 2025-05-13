var Cima = keyboard_check(vk_up) or keyboard_check(ord("W"))
var Baixo = keyboard_check(vk_down) or keyboard_check(ord("S"))
var Esquerda = keyboard_check(vk_left) or keyboard_check(ord("A"))
var Direita = keyboard_check(vk_right) or keyboard_check(ord("D"))

var VelV = (Baixo - Cima) * Vel
var VelH = (Direita - Esquerda) * Vel


repeat(abs(VelV))
{
	//Colisão Vertical
	if(!place_meeting(x, y + sign(VelV), Colisor))
	{
		y += sign(VelV)
	}
	else //Colidindo
	{
		VelV = 0
	}
}
	
repeat(abs(VelH))
{
	//Colisão Horizontal
	if(!place_meeting(x + sign(VelH), y, Colisor))
	{
		x += sign(VelH)
	}
	else //Colidindo
	{
		VelH = 0
	}
}


// ---------------------------- //

if keyboard_check(vk_left) or keyboard_check(ord("A"))
{
 image_xscale=-1
}

if keyboard_check(vk_right) or keyboard_check(ord("D"))
{
image_xscale=1
}

