function estado() constructor
{
	//iniciando o estado
	static inicia = function() {};
	//rodando o estado
	static roda = function() {};
	//finalizando o estado
	static finaliza = function() {};
}

//Funções para controlar minha máquina de estado
//Iniciando o estado
function inicia_estado(_estado)
{
	//Salvando o estado passado em uma variavel
	estado_atual = _estado;
	
	//iniciando o estado atual
	estado_atual.inicia();
}

//Rodando o estado
function roda_estado(_estado)
{
	estado_atual = _estado;
	
	estado_atual.roda();
}

//Trocando de estado
function troca_estado(_estado)
{
	//finalizando o estado atual 
	estado_atual.finaliza();
	
	//Rodando o proximo estado
	estado_atual = _estado;
	
	//Iniciando o proximo estado
	estado_atual.inicia();
}