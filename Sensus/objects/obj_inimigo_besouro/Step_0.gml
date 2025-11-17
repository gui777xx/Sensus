// ================================================================
// Evento STEP do obj_inimigo_besouro (Versão correta e limpa)
// ================================================================

// 1. Verifica se a variável de estado é válida (um struct)
// 2. Verifica se o estado atual tem uma função "roda" para executar
// 3. Se tiver, executa a função.

if (is_struct(besouro_estado) && variable_struct_exists(besouro_estado, "roda"))
{
    besouro_estado.roda();
}
