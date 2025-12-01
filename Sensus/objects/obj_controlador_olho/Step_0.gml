if (keyboard_check_pressed(ord("Q"))) {
    global.eyes_closed = !global.eyes_closed;
}

// Fade suave da overlay (opcional, mas recomendado)
var target = global.eyes_closed ? 1 : 0;
global.overlay_alpha = lerp(global.overlay_alpha, target, 0.25);
