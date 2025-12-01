/// @description Step Event for obj_game_over

// Lógica de Transição (Fade-in)
if (fade_state == 0)
{
    alpha_fade += fade_speed;
    
    // Se o fade-in estiver completo
    if (alpha_fade >= 1)
    {
        alpha_fade = 1;
        fade_state = 1; // Muda para o estado de espera
        
        // Cria o botão de reiniciar
        if (!button_created)
        {
            // Cria o botão no centro inferior da tela
            // Certifique-se de que "Instances" é o nome da sua camada de objetos
            instance_create_layer(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, 
                                  camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) * 0.75, 
                                  "Instances", obj_restart_button);
            button_created = true;
        }
    }
}