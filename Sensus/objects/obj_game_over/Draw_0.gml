/// @description Draw Event for obj_game_over

// 1. Desenha a Transição (Tela Preta com Alpha)
draw_set_alpha(alpha_fade);
draw_set_color(c_black);

// Desenha um retângulo que cobre toda a tela (view/câmera)
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

draw_rectangle(_cam_x, _cam_y, _cam_x + _cam_w, _cam_y + _cam_h, false);

draw_set_alpha(1); // Reseta a transparência

// 2. Desenha o Texto "Game Over" e Pontuação
if (fade_state >= 1)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    
    // Descomente e use sua fonte se tiver criado
    // draw_set_font(fnt_game_over); 
    
    var _center_x = _cam_x + _cam_w / 2;
    var _center_y = _cam_y + _cam_h / 2;
    
    // Desenha o texto "Game Over"
    draw_text(_center_x, _center_y - 50, game_over_text);
    
    // Desenha a Pontuação (Exemplo)
    // draw_text(_center_x, _center_y + 20, "Pontuação Final: " + string(score_display));
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

draw_set_color(c_white); // Reseta a cor
