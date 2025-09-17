// Inherit the parent event
event_inherited();

#region estado_parado

estado_parado.inicia = function()
{
	//define a sprite que ele vai usar
	sprite_index = escopiao_parado;
	//iniciar a animação do começo
	image_index = 0;
}

estado_parado.roda() = function()
{

}

#endregion

#region estado_andando

estado_andando.inicia = function()
{
	sprite_index = escopiao_andando
	image_index = 0;
}

estado_andando.roda = function()
{
	
}

#endregion

#region estado_dano

estado_dano.inicia = function()
{
	sprite_index = escopiao_dano_frente;
	image_index = 0;
}

estado_dano.roda = function()
{
	
}

#endregion

#region estado_morrendo 

estado_morrendo.inicia = function()
{
	sprite_index = escopiao_morrendo;
	image_index = 0;
}

estado_morrendo.roda = function()
{
	
}

#endregion

//iniciando o estado com as modificações
inicia_estado(estado_parado)