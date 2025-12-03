// Ativa animação de fundo
sprite_index = Splash_Screen_Abertura // seu sprite animado
image_speed = 0.2; // velocidade da animação

// Cria os botões
var cx = room_width / 2;
var cy = room_height / 2;

instance_create_layer(cx, cy, "Instances", obj_play_button);
instance_create_layer(cx, cy + 200, "Instances", obj_quit_button_splash);