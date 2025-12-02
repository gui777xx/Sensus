/// @description Create Event for obj_game_over

game_over_text = "GAME OVER";

// Torna o cursor visível
window_set_cursor(cr_default);

// Cria os botões centralizados
var _center_x = room_width / 2;
var _center_y = room_height * 0.75;
fade_alpha = 0;       // Começa transparente
fade_speed = 0.02;    // Velocidade do fade (ajuste como quiser)
botao_criado = false; // Controla quando os botões aparecem


// Botão de reiniciar
instance_create_layer(_center_x - 120, _center_y, "Instances", obj_restart_button);

// Botão de sair
instance_create_layer(_center_x + 120, _center_y, "Instances", obj_quit_button);