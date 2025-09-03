// --- Step Event ---

image_speed = 0;

if (place_meeting(x, y, obj_player)) {
    image_speed = 1;
} else {
    if (image_index > 2) {
        image_speed = 1;
    } else {
        image_speed = 0;
    }
}

// Dano + Knockback
if (place_meeting(x, y, obj_player) && image_index > 10 && image_index < 17) {
    with (obj_player) {
        receber_dano(other); // envia esta armadilha como fonte de knockback
    }
}