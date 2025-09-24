/// Evento de Colisão: escorpião com player

// Só dá dano se o player não estiver imune
if (!other.Imune) {
    other.receber_dano(id); // chama a função que já existe no player
}

// Escorpião não atravessa o player
x = xprevious;
y = yprevious;
