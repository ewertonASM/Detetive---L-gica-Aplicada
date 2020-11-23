testemunho(ewerton, amigo(leticia)).
testemunho(ewerton, inimigo(elaine)).

testemunho(leticia, nao_foi_festa(leticia)).
testemunho(leticia, estranho(leticia)).


testemunho(elaine, inocente(elaine)).
testemunho(elaine, foi_a_festa(ewerton)).
testemunho(elaine, foi_a_festa(leticia)).

inconsistente(amigo(X), inimigo(X)).
inconsistente(amigo(X), estranho(X)).
inconsistente(inimigo(X), estranho(X)).
inconsistente(nao_foi_festa(X), foi_a_festa(X)).

assassino(M):-
    member(M,[ewerton,leticia,elaine]),
    select(M,[ewerton,leticia,elaine], Testemunhas),
    consistente(Testemunhas).

consistente(W) :-
  \+ testemunho_inconsistente(W).

testemunho_inconsistente(W) :-
    member(X,W),
    member(Y,W),
    X  \=  Y,
    testemunho(X,XT),
    testemunho(Y,YT),
    inconsistente(XT,YT).