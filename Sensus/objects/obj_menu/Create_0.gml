// Splash principal
main_splash = Splash_Screen_Abertura;
sprite_index = main_splash;
image_index = 0;
image_speed = 0.8;

// Lista de alternativas
splash_sprites = [Caverna, Lua, Parado];

// Controle
using_main = true;      // começa com a principal
swap_timer = 0;
swap_interval = room_speed * 5; // troca a cada 5 segundos

// Transparência das alternativas
// Cria os botões
var cx = room_width / 2;
var cy = room_height / 2;

instance_create_layer(cx, cy, "Instances", obj_play_button);
instance_create_layer(cx, cy + 200, "Instances", obj_quit_button_splash);
