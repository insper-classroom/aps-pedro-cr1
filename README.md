[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/tgRCPRor)

## LINK VIDEO APS D: https://youtu.be/QAOcdccR_vQ
## LINK VIDEO APS E: https://youtu.be/WUtIw8MrBfU
## LINK VIDEO APS F: https://youtube.com/shorts/dg-3e2N-yWc


-   **Nome: Láisa Camilly de Oliveira**<br><br>
    Email-insper: laisaco1@al.insper.edu.br<br><br>
    User-github: laisacamilly
 
-   **Nome: Enrico Castro Guarita**<br><br>
    Email-insper: enricocg@al.insper.edu.br<br><br>
    User-github: enricocg21
 
-   **Nome: Caio Souza Rosa**<br><br>
    Email-insper: Caiosr2@al.insper.edu.br<br><br>
    User-github: Caiosr2
    
-   **Nome: Pedro Averame Kramer**<br><br>
    Email-insper: pedroak@al.insper.edu.br<br><br>
    User-github: P-Kramer

-   **Nome: Felipe Serra Silva**<br><br>
    Email-insper: felipess16@al.insper.edu.br<br><br>
    User-github: Felipe-Serra-Silva

-   **Nome: Joseph Perl**<br><br>
    Email-insper: josephp@al.insper.edu.br<br><br>
    User-github: josephperl
    
## LINK VIDEO APS B: https://youtube.com/shorts/8-ezzWqeykY?feature=share
## LINK VIDEO APS C: https://youtu.be/X6VJEk8TwP8

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
