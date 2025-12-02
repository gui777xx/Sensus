var _mouse_x = mouse_x;
var _mouse_y = mouse_y;

var _x1 = x - button_width / 2;
var _y1 = y - button_height / 2;
var _x2 = x + button_width / 2;
var _y2 = y + button_height / 2;

hover = point_in_rectangle(_mouse_x, _mouse_y, _x1, _y1, _x2, _y2);

if (hover && mouse_check_button_pressed(mb_left)) {
    game_end(); // fecha o jogo
}