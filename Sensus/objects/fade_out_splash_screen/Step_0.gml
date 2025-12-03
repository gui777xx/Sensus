{
	if (--countdown <= 0)
	{
	image_alpha = min(1.0, image_alpha + fade_out_delta)
	}
	
	if (image_alpha >= 1.0)
	{
		room_goto(Menu_principal)
	}
}