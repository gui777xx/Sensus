//Timer para mudar de estado
tempo_estado = game_get_speed(gamespeed_fps) * 15 ;
timer_estado = tempo_estado;

destino_x = 0;
destino_y = 0;


// Inherit the parent event
event_inherited();

//estado de perseguição ao player(talvez seja particular talvez todos tenham)
estado_persegue = new estado()

#region estado_parado

estado_parado.inicia = function()
{
	//define a sprite que ele vai usar
	sprite_index = escopiao_parado;
	//iniciar a animação do começo
	image_index = 0;
	
	//retanndo o timer do estado 
	timer_estado = tempo_estado;
	
	image_blend = c_white
}

estado_parado.roda = function()
{
	//diminuindo o timer do estado
	timer_estado--;
	
	var _tempo = irandom(timer_estado);
	
	if(_tempo <= tempo_estado * .01)
	{
		var _estado_novo = choose(estado_parado, estado_andando, estado_andando)
		troca_estado(_estado_novo)
	}
}

#endregion

#region estado_andando

estado_andando.inicia = function()
{
	sprite_index = escopiao_andando
	image_index = 0;
	
	//retanndo o timer do estado 
	timer_estado = tempo_estado;
	
	//escolhendo um local no mapa e indo até lá
	
	
	//escolhendo um local no mapa aleatoriamente
	destino_x = irandom(room_width);
	destino_y = irandom(room_height);
	
}

estado_andando.roda = function()
{
	//diminuindo o timer do estado
	timer_estado--;
	
	var _tempo = irandom(timer_estado);
	
	if(_tempo <= 5)
	{
		var _estado_novo = choose(estado_parado, estado_andando)
		troca_estado(_estado_novo)
	}
	
	//indo até o destino enquanto desvio dos colisores
	mp_potential_step_object(destino_x, destino_y, 1, colisor)
	
}

#endregion

#region estado_dano

estado_dano.inicia = function()
{
	sprite_index = escopiao_dano_frente;
	image_index = 0;
	
	//perco vida
	vida--
}

estado_dano.roda = function()
{
	
	
	
	//saindo do estado de dano
	//se ainda tiver vida vai para o estado parado
	if (image_index >= image_number - .5)
	{
		if (vida > 0)
		{
			alvo = obj_player; 
			troca_estado(estado_persegue);
		}
		else // Não tenho vida, vou jogar no vasco!
		{
			troca_estado(estado_morrendo);
		}
	}
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
	//morte
	
	if (image_index >= image_number - .5)
	{
		instance_destroy();
	}
}

#endregion


#region estado_persegue 
estado_persegue.inicia = function()
{
	sprite_index = escopiao_andando;
	image_index  = 0;
	
	image_blend = c_fuchsia;

}

estado_persegue.roda = function()
{
	//Se o alvo não existe mais, fico parado
	if (!instance_exists(obj_player))
		{
			alvo = noone;
			troca_estado(estado_parado)
		}
	//Definindo o Player como alvo
	//seguindo o alvo
	mp_potential_step_object(alvo.x, alvo.y, 1, colisor);
	
	//Atacando o Player!!!
	//checando a distância para o  player
	var _dist = point_distance(x, y, alvo.x, alvo.y);
	
	if (_dist <= 10)
	{
		troca_estado(estado_atacando);
	}
	
	//cahamando outros inimigos para atacar
	var _n = instance_number(object_index);
	
	for (var i = 0; i < _n; i++)
	{
		//checando se eu não estou olhando pra mim mesmo
		var _escorpiao = instance_find(object_index, i);
		show_debug_message("kkkkkkkkk");
		if (_escorpiao == id)
		{
			//não faça nada porque sou eu 
		}
		else
		{
			//tenho que checar se ese cara ainda não está perseguindo o player
			if(_escorpiao.alvo != alvo)
			{
				
				//checando a distância desse inimigo
				var _dist = point_distance(x,y, _escorpiao.x, _escorpiao.y);
				if (_dist < 300)
				{
				//pedindo ajuda
				with(_escorpiao)
				{
					troca_estado(estado_persegue);
				}
			}
		}
	}
}
	
	show_debug_message(_n)
	
}

#region estado_atacando6
estado_atacando.inicia = function()
{
	sprite_index = escopiao_ataque_1;
	image_index  = 0;
}
estado_atacando.roda = function()
{
	//saindo do estado de ataque 
	if (image_index >= image_number - .5)
	{
		troca_estado(estado_parado);
	}
}


#endregion
//iniciando o estado com as modificações
inicia_estado(estado_parado)