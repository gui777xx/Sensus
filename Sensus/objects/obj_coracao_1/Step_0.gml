// Este coração representa os pontos 4, 5 e 6
var hp_total = global.Vida_jogador;
var hp_slot  = clamp(hp_total - 0, 1, 2); // 6→2, 5→1, 4→0

// Estado alvo (0 vazio, 1 meio, 2 cheio)
var target_state = hp_slot;

// Se mudou o estado, ajusta animação
if (target_state != current_state) {
    if (target_state == 2) {
        // cheio
        sprite_index = spr_full;
        image_speed  = -1;
        if (image_index < frame_full_half) image_index = frame_full_half;
    }
    else if (target_state == 1) {
        // meio
        if (current_state == 2) {
            sprite_index = spr_full;
            image_speed  = 1;
            image_index  = frame_full_start;
        } else if (current_state == 0) {
            sprite_index = spr_empty;
            image_speed  = -1;
            image_index  = frame_empty_last;
        } else {
            sprite_index = spr_full;
            image_speed  = 0;
            image_index  = frame_full_half;
        }
    }
    else { // target_state == 0
        // vazio
        sprite_index = spr_empty;
        image_speed  = 1;
        if (image_index < frame_full_half) image_index = frame_full_half;
    }

    current_state = target_state;
}

// Sincroniza parada nos frames finais
if (sprite_index == spr_full) {
    if (image_speed > 0 && image_index >= frame_full_half) {
        image_speed = 0;
        image_index = frame_full_half; // meio
    } else if (image_speed < 0 && image_index <= frame_full_start) {
        image_speed = 0;
        image_index = frame_full_start; // cheio
    }
} else if (sprite_index == spr_empty) {
    if (image_speed > 0 && image_index >= frame_empty_last) {
        image_speed = 0;
        image_index = frame_empty_last; // vazio
    } else if (image_speed < 0 && image_index <= frame_full_half) {
        image_speed = 0;
        image_index = frame_full_half; // meio
        if (current_state == 2) {
            sprite_index = spr_full;
            image_speed  = -1;
            image_index  = frame_full_half;
        }
    }
}
	