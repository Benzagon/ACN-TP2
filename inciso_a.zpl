set T := {1..24};
set T0 := {0..24};
set P := {"A","B","C","D","E"};
param d[P*T] := read "demanda_larga.csv" as "<2s,1n> 3n";

var x[P * T] integer >= 0;
var s[P * T0] integer >= 0;
var z[P * T] integer >= 0;

minimize costo_total: sum <i> in P : sum <t> in T : 370 * x[i, t];

subto s_inicial:
    forall <i> in P do
        s[i,0] == 0;

subto ligado_s:
    forall <i,t> in P * T do
        s[i,t] == s[i,t-1] + x[i, t] - d[i, t];

subto lotes_exactos:
    forall <i,t> in P * T do
        z[i,t] * 10 == x[i, t];

subto prod_maxima:
    forall <i,t> in P * T
        do x[i, t] <= 120;

subto stock_maximo:
    forall <t> in T
        do sum <i> in P: s[i, t] <= 900;