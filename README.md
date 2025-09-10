[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/tgRCPRor)


## LINK VIDEO: https://youtube.com/shorts/8-ezzWqeykY?feature=share


-   "nome": "Láisa Camilly de Oliveira",
    "email-insper": "laisaco1@al.insper.edu.br",
    "user-github": "laisacamilly"
 
-   "nome": "Enrico Castro Guarita",
    "email-insper": "enricocg@al.insper.edu.br",
    "user-github": "enricocg21"
 
-   "nome": "Caio Souza Rosa",
    "email-insper": "Caiosr2@al.insper.edu.br",
    "user-github": "Caiosr2"
    
-   "nome": "Pedro Averame Kramer",
    "email-insper": "pedroak@al.insper.edu.br",
    "user-github": "P-Kramer"

-   "nome": "Felipe Serra Silva",
    "email-insper": "felipess16@al.insper.edu.br",
    "user-github": "Felipe-Serra-Silva"

-   "nome": "Joseph Perl",
    "email-insper": "josephp@al.insper.edu.br",
    "user-github": "josephperl"
    

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
