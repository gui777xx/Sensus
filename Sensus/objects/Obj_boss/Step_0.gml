// obj_boss - Step Event

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

        sprite_index = Boss_parado;
        estado = "idle";
        pode_atacar = true;   // agora ele pode começar a atacar
    }
}

// -------------------- ATAQUES --------------------
if (estado == "idle" && pode_atacar) {
    // sorteia ataque (0 ou 1 por enquanto)
    ataque_atual = irandom(1);

    if (ataque_atual == 0) {
        estado = "atacando";
        sprite_index = Boss_furando_terra;
        image_index = 0;
        image_speed = 1;
    }
    else if (ataque_atual == 1) {
        estado = "atacando";
        sprite_index = Boss_outro_ataque; // substitua pelo sprite real
        image_index = 0;
        image_speed = 1;
    }
}

// -------------------- ATAQUE 1: FURANDO TERRA --------------------
if (estado == "atacando" && ataque_atual == 0) {
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        image_speed = 0;

        var pos = posicoes[irandom(array_length(posicoes)-1)];
        x = pos[0];
        y = pos[1];

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

        tempo_espera = room_speed * 2; // 2 segundos
        pode_atacar = false;
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