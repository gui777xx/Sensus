window_set_size(1920, 1080);
estar = "normal"

Vel = 1;
Vel_inicial = 1;

tem_chave_inglesa = false;

Imune = false;
Tempo_imune = 0;

global.Vida_jogador = 6;

atacando = false

recebendo_dano = false;
tempo_dano = 0;

 x_antes_da_queda = x;
 y_antes_da_queda = y

colide_atras  = false
colide_cima   = false;
colide_baixo  = false;
colide_frente = false;
objeto_colidido_frente = noone;

// Knockback
knockback_dx = 0;
knockback_dy = 0;
knockback_timer = 0;
knockback_force = 2;

// Queda em buraco
caindo_no_buraco = false;
tempo_caindo = 0;

function esta_em_buraco() {
    return place_meeting(x, y, obj_true_buraco);
}


// Função com suporte ao knockback
function receber_dano(source) {
    if (!Imune) {
        Imune = true;
        Tempo_imune = current_time + 1100; 
        global.Vida_jogador -= 1;
        recebendo_dano = true;

        sprite_index = Player_dano;
        image_index = 0;

        var duracao = sprite_get_number(Player_dano) / sprite_get_speed(Player_dano);
        tempo_dano = current_time + duracao * 1000;

        // Knockback (se uma fonte for passada)
        if (!is_undefined(source) && source != noone) {
            var dir = point_direction(source.x, source.y, x, y);
            knockback_dx = lengthdir_x(knockback_force, dir);
            knockback_dy = lengthdir_y(knockback_force, dir);
            knockback_timer = 10;
        } else {
            knockback_dx = 0;
            knockback_dy = 0;
            knockback_timer = 0;
        }
    }
}

