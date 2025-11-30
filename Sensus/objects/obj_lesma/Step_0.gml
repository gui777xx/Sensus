// Receber dano do slash
if (place_meeting(x, y, obj_slash)) {
    if (larva_estado == "normal" || larva_estado == "seguindo" || larva_estado == "acordando" || larva_estado == "atacando") {
        hp -= 1;

        if (hp == 1) {
            larva_estado = "dano";
            sprite_index = lesma_dano;
            image_index = 0;
            image_speed = 1;
        }
        else if (hp <= 0) {
            larva_estado = "morrendo";
            sprite_index = lesma_morrendo;
            image_index = 0;
            image_speed = 1;
        }
    }
}

// Estado MORRENDO
if (larva_estado == "morrendo") {
    if (image_index >= image_number - 1) {
        image_speed = 0;
        alpha_morte -= 0.05;
        image_alpha = alpha_morte;
        if (alpha_morte <= 0.05) {
            instance_destroy();
        }
    }
}

// Estado DANO (invulnerável e parado)
if (larva_estado == "dano") {
    hspeed = 0;
    vspeed = 0;

    if (image_index >= image_number - 1) {
        larva_estado = "seguindo";
        sprite_index = lesma_andando;
        image_index = 0;   // ✅ reseta a animação de andar
        image_speed = 1;   // ✅ garante que o sprite ande não congele
    }
}

// Dormindo
if (larva_estado == "dormindo") {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist < distancia_ativacao) {
        larva_estado = "acordando";
        sprite_index = lesma_acordando;
        image_index = 0;
        image_speed = 1;       // ✅ anima o acordar
        global.larvas_alerta = true;
    }
}

// Se qualquer larva estiver em alerta, todas acordam
if (global.larvas_alerta && larva_estado == "dormindo") {
    larva_estado = "acordando";
    sprite_index = lesma_acordando;
    image_index = 0;
    image_speed = 1;           // ✅ anima o acordar
}

// Acordando
else if (larva_estado == "acordando") {
    if (obj_player.x > x) image_xscale = -1; else image_xscale = 1;

    if (image_index >= image_number - 1) {
        larva_estado = "seguindo";
        sprite_index = lesma_andando;
        image_index = 0;       // ✅ reseta ao começar a andar
        image_speed = 1;       // ✅ anima o andar
    }
}


// fugindo do jogador

else if (larva_estado == "seguindo") {
    if (obj_player.x > x) image_xscale = -1; else image_xscale = 1;

    var dist = point_distance(x, y, obj_player.x, obj_player.y);

    // Se o jogador estiver longe → ataque
    if (dist > distancia_ativacao && dist < ataque_distancia_range) {
        larva_estado = "atacando";
        sprite_index = lesma_ataque;
        image_index = 0;
        image_speed = 1;
    }
    else {
        contador_passos += 1;
        if (contador_passos >= intervalo_passos) {
            contador_passos = 0;

            var dir = point_direction(x, y, obj_player.x, obj_player.y) + 180;
            var new_x = x + lengthdir_x(velocidade, dir);
            var new_y = y + lengthdir_y(velocidade, dir);

            var conseguiu_andar = false;

            if (!place_meeting(new_x, new_y, obj_colisor_inimigos) && 
                !place_meeting(new_x, new_y, tiles) && 
                !place_meeting(new_x, new_y, colisivo)) {
                x = new_x;
                y = new_y;
                conseguiu_andar = true;
            } else {
                var angulos_desvio = [30, -30, 60, -60, 90, -90];
                for (var i = 0; i < array_length(angulos_desvio); i++) {
                    var desvio_angulo = dir + angulos_desvio[i];
                    new_x = x + lengthdir_x(velocidade, desvio_angulo);
                    new_y = y + lengthdir_y(velocidade, desvio_angulo);
                    if (!place_meeting(new_x, new_y, obj_colisor_inimigos) && 
                        !place_meeting(new_x, new_y, tiles) && 
                        !place_meeting(new_x, new_y, colisivo)) {
                        x = new_x;
                        y = new_y;
                        conseguiu_andar = true;
                        break;
                    }
                }
            }

            // Se não conseguiu fugir → força ataque (inclui bloqueio por obj_colisor_inimigos)
            if (!conseguiu_andar) {
                larva_estado = "atacando";
                sprite_index = lesma_ataque;
                image_index = 0;
                image_speed = 1;
				
            }
        }
    }
}


// Estado ATACANDO (parado e com sprite de ataque)
else if (larva_estado == "atacando") {
    hspeed = 0;
    vspeed = 0;

    sprite_index = lesma_ataque;
    image_speed = 1;

    // Disparo no frame 8 (ajuste se seu sprite começar em 0 e tem menos/more frames)
    // Usamos floor(image_index) para evitar flutuações
    if (!atacou_frame11 && floor(image_index) == 11) {
        atacou_frame11 = true;

        // Direção até o jogador
        var dir = point_direction(x, y, obj_player.x, obj_player.y);

        // Posição de spawn (um pequeno offset à frente da lesma, opcional)
        var spawn_x = x + lengthdir_x(8, dir);
        var spawn_y = y + lengthdir_y(8, dir);

        // Criar a gosma
        var proj = instance_create_layer(spawn_x, spawn_y, layer, obj_gosma);

        // Configurar movimento e visual do projétil
        proj.direction = dir;
        proj.speed = gosma_speed;      // você pode ajustar no CREATE do projétil também
        proj.image_angle = dir;        // alinha o sprite na direção de voo

        // Se quiser espelhar em vez de rotacionar, use image_xscale baseado em dir:
        // proj.image_xscale = (cos(degtorad(dir)) >= 0) ? 1 : -1;
    }

    // Ao terminar a animação de ataque, volta a andar e reseta a flag
    if (image_index >= image_number - 1) {
        larva_estado = "seguindo";
        sprite_index = lesma_andando;
        image_index = 0;
        image_speed = 1;
        atacou_frame11 = false; // permite novo disparo no próximo ataque
    }
}