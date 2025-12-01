/// @description Create Event for obj_game_over

// Variáveis de Transição
alpha_fade = 0; // Opacidade da tela preta (0 a 1)
fade_speed = 0.02; // Velocidade do fade (ajuste este valor)
fade_state = 0; // 0 = Fade-in, 1 = Espera

// Variáveis de Texto
game_over_text = "GAME OVER";

// Variáveis de Pontuação (Descomente se usar pontuação global)
// score_display = global.score;

// Cria o botão de reiniciar após o fade-in
button_created = false;
