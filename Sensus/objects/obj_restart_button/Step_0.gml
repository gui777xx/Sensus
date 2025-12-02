/// Step Event
var _mouse_x = mouse_x; // ou device_mouse_x_to_gui(0) se estiver usando GUI
var _mouse_y = mouse_y; // idem

var _button_x1 = x - button_width / 2;
var _button_y1 = y - button_height / 2;
var _button_x2 = x + button_width / 2;
var _button_y2 = y + button_height / 2;

// Verifica se o mouse está sobre o botão
if (point_in_rectangle(_mouse_x, _mouse_y, _button_x1, _button_y1, _button_x2, _button_y2))
{
    hover = true;

    if (mouse_check_button_pressed(mb_left))
    {
        // Ação do botão
        // Para restart:
        room_goto(Room_2);

        // Para sair:
        // game_end();
    }
}
else
{
    hover = false;
}