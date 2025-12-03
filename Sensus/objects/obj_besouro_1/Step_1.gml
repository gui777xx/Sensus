if (place_meeting(x, y, obj_hitbox_inimigos) && (besouro_estado != "morrendo" )) {
            with (obj_player) {
                receber_dano(other);
            }
		 }
		 
		 if (besouro_estado == "morrendo") {
    if (image_index >= image_number - 1) {
        image_speed = 0;
        alpha_morte -= 0.05;
        image_alpha = alpha_morte;
        if (image_alpha <= 0.05) {
            instance_destroy();
        }
    }
	 }