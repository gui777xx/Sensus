if place_meeting(x, y, obj_slash)

{
    larva_estado = "morrendo";
    sprite_index = Larva_morrendo;
    image_index = 0;
    image_speed = 0.5; // velocidade da animação de morte
}

if (larva_estado == "morrendo") { // Espera a animação terminar 
	if (image_index >= image_number - 1)
	{ image_speed = 0 alpha_morte -= 0.02;
		// diminui a transparência
		image_alpha = alpha_morte;
		if (alpha_morte <= 0.05) 
		{ instance_destroy();
			// remove a larva
		} 
	}
}