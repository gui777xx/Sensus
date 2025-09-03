if place_meeting(x, y, obj_player)
{
	if image_alpha > 0
	{
		image_alpha -= 0.01
	}
}
else
{
	if image_alpha < 1
	{
		image_alpha += 0.01
	}
}
