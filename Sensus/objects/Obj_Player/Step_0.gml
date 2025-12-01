/// @description Step Event do obj_player (Completo e Corrigido)

// =================================================
// LÓGICA DE MORTE (CORRIGIDA)
// =================================================
if (global.Vida_jogador <= 0)
{
    // Cria o objeto controlador da tela de morte na camada correta
    instance_create_layer(0, 0, "Ins_Entidades", obj_game_over);
    
    // Destrói o objeto do jogador
    instance_destroy();
    
    // IMPORTANTE: Usa 'exit;' para garantir que o resto do código do Step não seja executado
    exit; 
}
// =================================================


// Ajustando a Profundidade

// Inicializa variáveis de colisão frontal
if (!variable_instance_exists(id, "colide_cima")) {
    colide_cima   = false;
    colide_baixo  = false;
    colide_frente = false;
    colide_atras  = false;
    objeto_colidido_frente = noone;
}

// Salva posição segura fora do buraco
if (!caindo_no_buraco && !esta_em_buraco()) {
    x_antes_da_queda = x;
    y_antes_da_queda = y;
}

// Controle de queda 
if (caindo_no_buraco) {
    atacando = false;
    if (image_index >= sprite_get_number(Player_caindo) - 1 || current_time >= tempo_caindo) {
        caindo_no_buraco = false;
        receber_dano(noone);

        var delta_x = x_antes_da_queda - x;
        var ajuste = 3;

        if (abs(delta_x) > 0) {
            x = x_antes_da_queda + sign(delta_x) * ajuste;
        } else {
            x = x_antes_da_queda;
        }

        y = y_antes_da_queda;
    }
    return;
}

// Controle de knockback
if (knockback_timer > 0) {
    var next_x = x + knockback_dx;
    var next_y = y + knockback_dy;
    var tile     = layer_tilemap_get_id("Tiles_Parede_Cantos");
    var colisivo = layer_tilemap_get_id("Tiles_Colisor");

    if (!place_meeting(next_x, y, [tile, colisivo, colisor])) x = next_x;
    else knockback_dx = 0;

    if (!place_meeting(x, next_y, [tile, colisivo, colisor])) y = next_y;
    else knockback_dy = 0;

    knockback_dx *= 0.9;
    knockback_dy *= 0.9;
    knockback_timer -= 1;
    return;
}

if (keyboard_check_pressed(ord("E"))) {
    var controlador = instance_place(x, y, obj_controlador_bau);

    if (controlador != noone) {
        var bau = instance_nearest(controlador.x, controlador.y, obj_bau);

        if (bau != noone && !bau.aberto) {
            bau.abrir();
        }

        with (controlador) {
            instance_destroy();
        }
    }
}

// Imunidade temporária
if (Imune && current_time >= Tempo_imune) {
    Imune = false;
}

// Controle de dano
if (recebendo_dano) {
    atacando = false;
    if (image_index >= sprite_get_number(Player_dano) - 1 || current_time >= tempo_dano) {
        recebendo_dano = false;
        sprite_index = Player_parado_baixo;
        image_index = 0;
    }
    return;
}

// ----------------------
// Controle de ataque
// ----------------------
// >>> BLOQUEIO EXTRA: não atacar se estiver descendo <<<
if (mouse_check_button_pressed(mb_left) && !atacando && tem_chave_inglesa && estar != "descendo") {

    atacando = true;

    var angulo = point_direction(x, y, mouse_x, mouse_y);
    var ataque_sprite;

    if (angulo >= 72 && angulo < 108) {
        ataque_sprite = Player_ataque_cima;
    } else if ((angulo >= 36 && angulo < 72) || (angulo >= 108 && angulo < 144)) {
        ataque_sprite = Player_ataque_diagonal_cima;
    } else if ((angulo >= 162 && angulo < 198) || (angulo >= 342 || angulo < 18)) {
        ataque_sprite = Player_ataque_frente;
    } else if ((angulo >= 198 && angulo < 234) || (angulo >= 306 && angulo < 342)) {
        ataque_sprite = Player_ataque_diagonal_baixo;
    } else if (angulo >= 234 && angulo < 306) {
        ataque_sprite = Player_ataque_baixo;
    } else {
        ataque_sprite = Player_ataque_frente;
    }

    sprite_index = ataque_sprite;
    image_index = 0;
    image_speed = 1;

    var distancia = 6;
    var x_slash = x + lengthdir_x(distancia, angulo);
    var y_slash = y + lengthdir_y(distancia, angulo);

    if (angulo >= 42 && angulo < 138) {
        y_slash -= 2;
    }

    var slash = instance_create_layer(x_slash, y_slash, layer, obj_slash);
    slash.image_angle = angulo;
    slash.player_x = x;
    slash.player_y = y;
    return;
}

if (atacando) {
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        atacando = false;
        sprite_index = Player_parado_baixo;
        image_index = 0;
    }
    return;
}

if (!atacando) {
    image_xscale = (mouse_x < x) ? -1 : 1;
}

// Input
var cima      = keyboard_check(vk_up)    || keyboard_check(ord("W"));
var baixo     = keyboard_check(vk_down)  || keyboard_check(ord("S"));
var esquerda  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var direita   = keyboard_check(vk_right) || keyboard_check(ord("D"));

if (colide_cima)    cima = false;
if (colide_baixo)   baixo = false;
if (colide_frente) {
    if (image_xscale == 1) direita = false;
    else esquerda = false;
}

if (colide_atras) {
    if (image_xscale == -1) direita = false;
    else esquerda = false;
}

var x_ant = x;
var y_ant = y;
var dir_v = baixo - cima;
var dir_h = direita - esquerda;
var vel   = Vel;

var x_novo = x + dir_h * vel;
var y_novo = y + dir_v * vel;

var tile     = layer_tilemap_get_id("Tiles_Parede_Cantos");
var colisivo = layer_tilemap_get_id("Tiles_Colisor");

if (!place_meeting(x_novo, y, [tile, colisivo, colisor])) x = x_novo;
if (!place_meeting(x, y_novo, [tile, colisivo, colisor])) y = y_novo;

var se_moveu = (x != x_ant) || (y != y_ant);

// ----------------------
// NOVA LÓGICA DE ESTADO
// ----------------------
if (estar == "descendo") {
    sprite_index = Player_descendo;
    image_speed  = 1;
    image_xscale = 1; // força sempre virado 

    // Verifica se chegou no último frame
    if (image_index >= image_number - 1) {
        image_speed = 0;   // congela a animação
        hspeed = 0;        // trava movimento horizontal
        vspeed = 0;        // trava movimento vertical
    }

} else {
    // Define sprite de movimento normal
    if (se_moveu) {
        var angulo_mouse = point_direction(x, y, mouse_x, mouse_y);
        var indo_ao_contrario = ((image_xscale == 1 && dir_h < 0) || (image_xscale == -1 && dir_h > 0));
        var sprite_mov;

        if (angulo_mouse >= 36 && angulo_mouse < 144) {
            sprite_mov = indo_ao_contrario ? Player_re_cima : Player_correndo_cima;
        } else if (angulo_mouse >= 198 && angulo_mouse < 342) {
            sprite_mov = indo_ao_contrario ? Player_re_baixo : Player_correndo_baixo;
        } else {
            sprite_mov = indo_ao_contrario ? Player_re : Player_correndo;
        }

        sprite_index = sprite_mov;
    } else {
        if (!atacando && !se_moveu) {
            var angulo_mouse = point_direction(x, y, mouse_x, mouse_y);

            if (angulo_mouse >= 36 && angulo_mouse < 144) {
                sprite_index = Player_parado_cima;
            } else if (angulo_mouse >= 198 && angulo_mouse < 342) {
                sprite_index = Player_parado_baixo;
            } else {
                sprite_index = Player_parado;
            }
        }
    }
}