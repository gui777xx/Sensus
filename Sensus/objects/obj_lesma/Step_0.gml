// Invulnerabilidade pós-dano
if (invulneravel_timer > 0) {
    invulneravel_timer -= 1;
    invulneravel = true;
} else if (larva_estado != "dano" && larva_estado != "morrendo") {
    invulneravel = false;
}

// Receber dano do slash (detecção no Step)
var sobreposto_com_slash = place_meeting(x, y, obj_slash);

if (sobreposto_com_slash && !invulneravel && larva_estado != "dano" && larva_estado != "morrendo" && !hit_lock) {
    // Aplica dano
    hp -= 1;

    // Entra em estado de dano (com knockback), ou morrendo se zerar HP
    if (hp <= 0) {
        larva_estado = "morrendo";
        sprite_index = lesma_morrendo;
        image_index = 0;
        image_speed = 1;
    } else {
        larva_estado = "dano";
        sprite_index = lesma_dano;
        image_index = 0;
        image_speed = 1;

        // I-frames
        invulneravel = true;
        invulneravel_timer = invulneravel_timer_padrao;

        // Knockback na direção oposta ao player
        knockback_dir   = point_direction(obj_player.x, obj_player.y, x, y);
        knockback_vel   = knockback_forca;
        knockback_timer = knockback_max;
    }

    // Travar reentrada enquanto sobreposto
    hit_lock = true;
}

// Libera o hit_lock quando não estiver mais sobreposto
if (!sobreposto_com_slash) {
    hit_lock = false;
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

// Estado DANO (aplica knockback com colisão e só então volta a seguir)
if (larva_estado == "dano") {
    hspeed = 0;
    vspeed = 0;

    // Aplica knockback enquanto durar
    if (knockback_timer > 0) {
        knockback_timer -= 1;

        var new_x = x + lengthdir_x(knockback_vel, knockback_dir);
        var new_y = y + lengthdir_y(knockback_vel, knockback_dir);

        if (!place_meeting(new_x, new_y, obj_colisor_inimigos)
        && !place_meeting(new_x, new_y, tiles)
        && !place_meeting(new_x, new_y, colisivo)) {
            x = new_x;
            y = new_y;
        } else {
            // Se colidir, cancela knockback
            knockback_timer = 0;
            knockback_vel = 0;
        }

        // Desaceleração
        knockback_vel *= knockback_drag;
    }

    // Ao terminar a animação de dano, volta a seguir
    if (image_index >= image_number - 1) {
        larva_estado = "seguindo";
        sprite_index = lesma_andando;
        image_index = 0;   // reseta animação de andar
        image_speed = 1;   // garante que o sprite não congele
    }

    // Durante "dano" nada além deve rodar
    exit;
}

// Dormindo
if (larva_estado == "dormindo") {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist < distancia_ativacao) {
        larva_estado = "acordando";
        sprite_index = lesma_acordando;
        image_index = 0;
        image_speed = 1;
        global.larvas_alerta = true;
    }
}

// Se qualquer larva estiver em alerta, todas acordam
if (global.larvas_alerta && larva_estado == "dormindo") {
    larva_estado = "acordando";
    sprite_index = lesma_acordando;
    image_index = 0;
    image_speed = 1;
}

// Acordando
else if (larva_estado == "acordando") {
    if (obj_player.x > x) image_xscale = -1; else image_xscale = 1;

    if (image_index >= image_number - 1) {
        larva_estado = "seguindo";
        sprite_index = lesma_andando;
        image_index = 0;
        image_speed = 1;
    }
}

// Seguindo (fugindo do jogador)
else if (larva_estado == "seguindo") {
    if (obj_player.x > x) image_xscale = -1; else image_xscale = 1;

    var dist = point_distance(x, y, obj_player.x, obj_player.y);

    // Se o jogador estiver numa faixa adequada → ataque à distância
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

            // Se não conseguiu fugir → força ataque
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

    // Disparo no frame 11 (ajuste conforme seu sprite)
    if (!atacou_frame11 && floor(image_index) == 11) {
        atacou_frame11 = true;

        // Direção até o jogador
        var dir = point_direction(x, y, obj_player.x, obj_player.y);

        // Offset à frente da lesma (opcional)
        var spawn_x = x + lengthdir_x(8, dir);
        var spawn_y = y + lengthdir_y(8, dir);

        // Criar a gosma
        var proj = instance_create_layer(spawn_x, spawn_y, layer, obj_gosma);

        // Configurar projétil
        proj.direction = dir;
        proj.speed = gosma_speed;
        proj.image_angle = dir;
    }

    // Ao terminar a animação de ataque, volta a andar e reseta a flag
    if (image_index >= image_number - 1) {
        larva_estado = "seguindo";
        sprite_index = lesma_andando;
        image_index = 0;
        image_speed = 1;
        atacou_frame11 = false;
    }
}