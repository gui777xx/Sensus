 depth = + 1 


// Move lentamente 4 pixels para baixo
if (y < y_inicial + 6) {
    y += 0.2; // velocidade lenta
}

// Detecta aproximação
encostando = place_meeting(x, y, obj_player);

// Mensagem 2 aparece apenas se estiver encostando e NÃO tiver mensagem 3 ativa
mostrar_texto_2 = encostando && !mostrar_texto_3;

// Ação ao apertar E
if (encostando && keyboard_check_pressed(ord("E"))) {
    if (global.Vida_jogador < 8) {
        global.Vida_jogador += 1;
        instance_destroy(); // coleta o meio coração
    } else {
        // Vida cheia: ativa texto 3 por 2 segundos
        mostrar_texto_3 = true;
        alarm[0] = game_get_speed(gamespeed_fps) * 2; // 2 segundos
    }
}
   