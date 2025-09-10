[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/tgRCPRor)


## LINK VIDEO: https://youtube.com/shorts/8-ezzWqeykY?feature=share


-   Nome: Láisa Camilly de Oliveira
    Email-insper: laisaco1@al.insper.edu.br
    User-github: laisacamilly
 
-   Nome: Enrico Castro Guarita
    Email-insper: enricocg@al.insper.edu.br
    User-github: enricocg21
 
-   Nome: Caio Souza Rosa
    Email-insper: Caiosr2@al.insper.edu.br
    User-github: Caiosr2
    
-   Nome: Pedro Averame Kramer
    Email-insper: pedroak@al.insper.edu.br
    User-github: P-Kramer

-   Nome: Felipe Serra Silva
    Email-insper: felipess16@al.insper.edu.br
    User-github: Felipe-Serra-Silva

-   Nome: Joseph Perl
    Email-insper: josephp@al.insper.edu.br
    User-github: josephperl
    

```
export SIM=ghdl
pip3 install -r requirements.txt
cd b_logComb
SIM=ghdl pytest -s
```

## Rodando apenas um teste

Para executar apenas um teste você pode passar o nome deles usando `-k` 

```
SIM=ghdl pytest -k and16
```

Apenas o `and16` sera testado.

## Dica

Digite no terminal uma única vez para habilitar o uso do simulador ghdl

```bash
echo 'export SIM=ghdl' >> $HOME/elementos.sh
