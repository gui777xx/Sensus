// Fundo com fade
draw_set_alpha(fade_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

// Texto "GAME OVER" com fade
draw_set_alpha(fade_alpha);
draw_set_font(fnt_game_over);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var cx = room_width / 2;
var cy = room_height / 2;
draw_text(cx, cy - 50, game_over_text);

draw_set_alpha(1);
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
