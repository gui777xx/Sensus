// Estado atual do coração (0 vazio, 1 meio, 2 cheio)
current_state = -1;

// Sprites
spr_full  = Coracao;       // cheio → meio
spr_empty = Dano_coracao;  // meio → vazio

frame_full_start = 0;   // cheio
frame_full_half  = 9;   // meio
frame_empty_last = 19;  // vazioo