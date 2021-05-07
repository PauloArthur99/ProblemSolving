vestido(amarelo).
vestido(azul).
vestido(branco).
vestido(verde).
vestido(vermelho).

nome(cintia).
nome(patricia).
nome(rebeca).
nome(renata).
nome(silvia).

programa(cinema).
programa(culinaria).
programa(humor).
programa(musica).
programa(turismo).

horario(18).
horario(19).
horario(20).
horario(21).
horario(22).

idade(35).
idade(40).
idade(45).
idade(50).
idade(55).

signo(aquario).
signo(aries).
signo(cancer).
signo(escorpiao).
signo(libra).


%X está à ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).
                       
%X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X), 
                        nth0(IndexY,Lista,Y), 
                        IndexX < IndexY.

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao(ListaSolucao) :- 

    ListaSolucao = [
        apresentadora(Vestido1, Nome1, Programa1, Horario1, Idade1, Signo1),
        apresentadora(Vestido2, Nome2, Programa2, Horario2, Idade2, Signo2),
        apresentadora(Vestido3, Nome3, Programa3, Horario3, Idade3, Signo3),
        apresentadora(Vestido4, Nome4, Programa4, Horario4, Idade4, Signo4),
        apresentadora(Vestido5, Nome5, Programa5, Horario5, Idade5, Signo5)
    ],

    %O programa das 21 horas é apresentado pela apresentadora de vestido Amarelo.
    member(apresentadora(amarelo, _, _, 21, _, _), ListaSolucao),

    %Cíntia está ao lado da apresentadora do programa das 18 horas.
    aoLado(apresentadora(_, cintia, _, _, _, _), apresentadora(_, _, _, 18, _, _), ListaSolucao),
    
    %A mulher de 45 anos está em algum lugar entre a mulher de 50 anos e a mulher de 40 anos, nessa ordem.
    aEsquerda(apresentadora(_, _, _, _, 50, _), apresentadora(_, _, _, _, 45, _), ListaSolucao),
    aEsquerda(apresentadora(_, _, _, _, 45, _), apresentadora(_, _, _, _, 40, _), ListaSolucao),
    
    %A mulher de Verde está em algum lugar à esquerda da apresentadora do signo de Câncer.
    aEsquerda(apresentadora(verde, _, _, _, _, _), apresentadora(_, _, _, _, _, cancer), ListaSolucao),
    
    %A apresentadora do programa de Humor está ao lado da apresentadora de 40 anos.
    aoLado(apresentadora(_, _, humor, _, _, _), apresentadora(_, _, _, _, 40, _), ListaSolucao),
    
    %A mulher de Amarelo está em algum lugar entre a apresentadora das 20 horas e a Rebeca, nessa ordem.
    aEsquerda(apresentadora(_, _, _, 20, _, _), apresentadora(amarelo, _, _, _, _, _), ListaSolucao),
    aEsquerda(apresentadora(amarelo, _, _, _, _, _), apresentadora(_, rebeca, _, _, _, _), ListaSolucao),
    
    %Renata está ao lado da mulher mais velha.
    aoLado(apresentadora(_, renata, _, _, _, _), apresentadora(_, _, _, _, 55, _), ListaSolucao),
    
    %Na terceira posição encontra-se a apresentadora de 45 anos.
    Idade3 = 45,
    
    %A mulher de vestido Vermelho apresenta o programa das 18 horas.
    member(apresentadora(vermelho, _, _, 18, _, _), ListaSolucao),
    
    %A apresentadora do signo de Escorpião está ao lado da apresentadora mais nova.
    aoLado(apresentadora(_, _, _, _, _, escorpiao), apresentadora(_, _, _, _, 35, _), ListaSolucao),
    
    %A apresentadora do programa Musical está ao lado da apresentadora do programa Humorístico.
    aoLado(apresentadora(_, _, musica, _, _, _), apresentadora(_, _, humor, _, _, _), ListaSolucao),
    
    %A mulher de 35 anos está em algum lugar à direita da mulher de vestido Branco.
    aEsquerda(apresentadora(branco, _, _, _, _, _), apresentadora(_, _, _, _, 35, _), ListaSolucao),
    
    %A mulher de vestido Amarelo está em algum lugar entre a mulher que apresenta o programa de Cinema e a Renata, nessa ordem.
    aEsquerda(apresentadora(_, _, cinema, _, _, _), apresentadora(amarelo, _, _, _, _, _), ListaSolucao),
    aEsquerda(apresentadora(amarelo, _, _, _, _, _), apresentadora(_, renata, _, _, _, _), ListaSolucao),
    
    %A apresentadora do programa das 22 horas está exatamente à esquerda da apresentadora do programa das 18 horas.
    aoLado(apresentadora(_, _, _, 22, _, _), apresentadora(_, _, _, 18, _, _), ListaSolucao),
    aEsquerda(apresentadora(_, _, _, 22, _, _), apresentadora(_, _, _, 18, _, _), ListaSolucao),
    
    %A mulher de Azul apresenta o programa cujo tema é Cinema.
    member(apresentadora(azul, _, cinema, _, _, _), ListaSolucao),
    
    %Patrícia está exatamente à esquerda da apresentadora de Branco.
    aoLado(apresentadora(_, patricia, _, _, _, _), apresentadora(branco, _, _, _, _, _), ListaSolucao),
    aEsquerda(apresentadora(_, patricia, _, _, _, _), apresentadora(branco, _, _, _, _, _), ListaSolucao),
    
    %O programa de culinária é transmitido às 22 horas.
    member(apresentadora(_, _, culinaria, 22, _, _), ListaSolucao),
    
    %A apresentadora do programa das 19 horas está exatamente à direita da apresentadora do signo de Libra.
    aoLado(apresentadora(_, _, _, _, _, libra), apresentadora(_, _, _, 19, _, _), ListaSolucao),
    aEsquerda(apresentadora(_, _, _, _, _, libra), apresentadora(_, _, _, 19, _, _), ListaSolucao),
    
    %A mulher de Amarelo está em algum lugar entre a mulher de 50 anos e a mulher do signo de Câncer, nessa ordem.
    aEsquerda(apresentadora(_, _, _, _, 50, _), apresentadora(amarelo, _, _, _, _, _), ListaSolucao),
    aEsquerda(apresentadora(amarelo, _, _, _, _, _), apresentadora(_, _, _, _, _, cancer), ListaSolucao),
    
    %A mulher do signo de Aquário está exatamente à esquerda da apresentadora do programa de Música.
    aoLado(apresentadora(_, _, _, _, _, aquario), apresentadora(_, _, musica, _, _, _), ListaSolucao),
    aEsquerda(apresentadora(_, _, _, _, _, aquario), apresentadora(_, _, musica, _, _, _), ListaSolucao),
    
    %A apresentadora do signo de Áries está ao lado da apresentadora de vestido Amarelo.
    aoLado(apresentadora(_, _, _, _, _, aries), apresentadora(amarelo, _, _, _, _, _), ListaSolucao),
    
    %Testa todas as possibilidades...
    vestido(Vestido1), vestido(Vestido2), vestido(Vestido3), vestido(Vestido4), vestido(Vestido5),
    todosDiferentes([Vestido1, Vestido2, Vestido3, Vestido4, Vestido5]),
    
    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    todosDiferentes([Nome1, Nome2, Nome3, Nome4, Nome5]),
    
    programa(Programa1), programa(Programa2), programa(Programa3), programa(Programa4), programa(Programa5),
    todosDiferentes([Programa1, Programa2, Programa3, Programa4, Programa5]),
    
    horario(Horario1), horario(Horario2), horario(Horario3), horario(Horario4), horario(Horario5),
    todosDiferentes([Horario1, Horario2, Horario3, Horario4, Horario5]),
    
    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]),

    signo(Signo1), signo(Signo2), signo(Signo3), signo(Signo4), signo(Signo5),
    todosDiferentes([Signo1, Signo2, Signo3, Signo4, Signo5]).
    
    
