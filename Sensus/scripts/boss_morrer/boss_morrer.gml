// ============================================================================
// Script/Função boss_morrer() (AJUSTE DE DESTRUIÇÃO)
// ============================================================================
function boss_morrer() {
    // Garante que a morte só seja iniciada uma vez
    if (!morrendo) {
        morrendo = true;
        estado = "morrendo"; // Novo estado para prioridade
        
        // Troca para o sprite de morte
        sprite_index = Boss_morrendo;
        image_index = 0;
        image_speed = 1;
        
        // Zera a velocidade para garantir que o boss pare
        speed = 0; 
        
        // Desativa a invulnerabilidade para garantir que a cor volte ao normal
        image_blend = c_white; 
        
        // Cancela todos os alarmes para parar qualquer ação pendente
        alarm_set(0, -1);
        alarm_set(1, -1);
        
        // NOVO: Calcula a duração da animação e usa alarm[2] para destruir
        // Duração em frames = (Número de Frames do Sprite) / (Image Speed)
       
        alarm_set(2, 90); // Destrói no final da animação
    }
}