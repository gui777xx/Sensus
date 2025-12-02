// ============================================================================
// obj_boss - STEP EVENT
// ============================================================================

// DEBUG - remova depois
draw_text(10, 10, "Estado: " + estado);
draw_text(10, 30, "Pode atacar: " + string(pode_atacar));
draw_text(10, 50, "Ataque atual: " + string(ataque_atual));



var dist = point_distance(x, y, obj_player.x, obj_player.y);

// -------------------- ALERTA --------------------
if (dist < distancia_alerta && !alerta && !animando_alerta) {
    alerta = true;
    animando_alerta = true;
    sprite_index = Boss_alerta;
    image_index = 0;
    image_speed = 1;
    
    obj_player.congelado = true;
}

if (animando_alerta) {
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        animando_alerta = false;
        image_speed = 1;
        
        obj_player.congelado = false;
        
        // Pronto para atacar
        sprite_index = Boss_parado;
        estado = "idle";
        pode_atacar = true;
    }
}

// -------------------- ESCOLHA DE ATAQUE --------------------
if (estado == "idle" && pode_atacar) {
    ataque_atual = irandom(1); // 0 = perfurar terra, 1 = ataque veneno
    pode_atacar = false; // IMPORTANTE: desabilita imediatamente para não repetir
    
    if (ataque_atual == 0) {
        // Ataque 1: furando terra
        estado = "atacando";
        sprite_index = Boss_furando_terra;
        image_index = 0;
        image_speed = 1;
    } else if (ataque_atual == 1) {
        // Ataque 2: animação + veneno
        estado = "atacando";
        sprite_index = Boss_ataque1;
        image_index = 0;
        image_speed = 1;
        veneno_spawnado = false;
    }
}

// -------------------- ATAQUE 1: FURANDO TERRA --------------------
if (estado == "atacando" && ataque_atual == 0) {
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        // Terminou de furar terra → fica parado no último frame
        image_speed = 0;
        
        // Escolhe posição aleatória
        var pos = posicoes[irandom(array_length(posicoes) - 1)];
        x = pos[0];
        y = pos[1];
        
        // Troca para sprite saindo da terra
        sprite_index = Boss_saindo_terra;
        image_index = 0;
        image_speed = 1;
        
        estado = "saindo";
    }
}

// -------------------- SAINDO DA TERRA --------------------
if (estado == "saindo") {
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        sprite_index = Boss_parado;
        image_speed = 1;
        estado = "espera";
        
        tempo_espera = room_speed * 2; // 2s de cooldown
    }
}

// -------------------- ATAQUE 2: ANIMAÇÃO + VENENO --------------------
if (estado == "atacando" && ataque_atual == 1) {
    // Quando chegar no último frame do Boss_ataque1, spawna o veneno
    if (!veneno_spawnado && image_index >= sprite_get_number(sprite_index) - 1) {
        veneno_spawnado = true;
        
        // Instancia o veneno na posição do boss
        var v = instance_create_layer(x, y, layer, Obj_veneno);
        
        // Entra direto em espera (acabou a animação de ataque)
        sprite_index = Boss_parado;
        image_speed = 1;
        estado = "espera";
        
        tempo_espera = room_speed * 1.5; // 1.5s de cooldown
    }
}

// -------------------- ESPERA ENTRE ATAQUES --------------------
if (estado == "espera") {
    tempo_espera -= 1;
    if (tempo_espera <= 0) {
        estado = "idle";
        pode_atacar = true;
    }
}