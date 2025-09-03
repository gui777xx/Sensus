x = obj_player.x;
y = obj_player.y;

  var esquerda  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
  var direita   = keyboard_check(vk_right) || keyboard_check(ord("D"));
  
  if (esquerda) image_xscale = -1;
  if (direita)  image_xscale =  1;