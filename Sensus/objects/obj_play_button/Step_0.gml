// Detecta hover
hover = point_in_rectangle(mouse_x, mouse_y,
                           x - sprite_width/2, y - sprite_height/2,
                           x + sprite_width/2, y + sprite_height/2);

if (hover && mouse_check_button_pressed(mb_left)) {
    room_goto(Room_2); // vai para a sala principal do jogo
}
