// Evento Step do obj_overlay
if (keyboard_check_pressed(ord("Q"))) {
    overlay_active = !overlay_active;
}

// Faz fade in/out suave
var E = 0.05;
if (overlay_active) {
    global.overlay_alpha = clamp(global.overlay_alpha + E, 0, 1);
} else {
    global.overlay_alpha = clamp(global.overlay_alpha - E, 0, 1);
}