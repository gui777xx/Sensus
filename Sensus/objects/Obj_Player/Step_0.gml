var Cima = keyboard_check(vk_up) or keyboard_check(ord("W"))
var Baixo = keyboard_check(vk_down) or keyboard_check(ord("S"))
var Esquerda = keyboard_check(vk_left) or keyboard_check(ord("A"))
var Direita = keyboard_check(vk_right) or keyboard_check(ord("D"))

var VelV = (Baixo - Cima) * Vel
var VelH = (Direita - Esquerda) * Vel

var Tile = layer_tilemap_get_id("Tiles_Parede_Cantos")
var Colisivo = layer_tilemap_get_id("Tiles_Colisor")

repeat(abs(VelV))
{
	//Colisão Vertical
	if(!place_meeting(x, y + sign(VelV), [Tile, Colisor, Colisivo]))
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
	if(!place_meeting(x + sign(VelH), y, [Tile, Colisor, Colisivo]))
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

if keyboard_check(vk_anykey)
{
	sprite_index=Player_Correndo_gambiarra
}
else
{
	sprite_index=Player_parado_gambiarra
}
// BLOQUEIA TUDO SE ESTIVER CAINDO
if (estado == "caindo") {
    tempo_queda += 1;

    y += 2; // jogador afunda
    image_angle += 10; // gira
    image_xscale *= 0.95;
    image_yscale *= 0.95;

    if (image_yscale < 0.1 || tempo_queda > 30) {
        if (vai_teleportar) {
            var destino = instance_nearest(x, y, casa_do_Lep)

            if (instance_exists(destino)) {
                x = destino.x;
                y = destino.y;
            }

            // Reset visual e estado
            image_xscale = 1;
            image_yscale = 1;
            image_angle = 0;

            estado = "andando";
            vai_teleportar = false;
        }
    }

    exit; // Impede o restante do código
}
