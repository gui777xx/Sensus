/// @description Step Event for obj_restart_button

// Posição do mouse na tela
var _mouse_x = device_mouse_x_to_gui(0);
var _mouse_y = device_mouse_y_to_gui(0);

// Posição do botão na tela
var _button_x1 = x - button_width / 2;
var _button_y1 = y - button_height / 2;
var _button_x2 = x + button_width / 2;
var _button_y2 = y + button_height / 2;

// Verifica se o mouse está sobre o botão
if (point_in_rectangle(_mouse_x, _mouse_y, _button_x1, _button_y1, _button_x2, _button_y2))
{
    hover = true;
    
    // Verifica se o botão esquerdo do mouse foi pressionado
    if (mouse_check_button_pressed(mb_left))
    {
        // Ação de Reiniciar o Jogo
        
        // Destrói os objetos da tela de morte
        instance_destroy(obj_game_over);
        instance_destroy(); // Destrói o próprio botão
        
        // Reinicia a sala atual
        room_restart(); 
        // OU: room_goto(room_start); // Para ir para uma sala específica
    }
}
else
{
    hover = false;
}
