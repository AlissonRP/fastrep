# mypdf1 (em construção)
Sempre quando eu criava algum arquivo em Rmarkdown (principalmente para [Sigma JR](https://www.instagram.com/_sigmajr/)), existia um padrão de pacotes necessários e funções que eu quase sempre utilizava.  
Assim esse pacote disponibiliza um template para  relatórios em pdf no Rmarkdown e funções bastantes usuais, note que é um pacote  mais *agregador* que criador.   

## Instalação
```r
devtools::install_github("https://github.com/AlissonRP/mypdf1")
```

## Algumas funções já disponíveis
### `pdf1_tbl`
Essa função serve para geração de tabelas, junto com o template a numeração das tabelas será produzida automaticamente, as tabelas podem ser referenciadas utilizando a sintaxe padrão 
do LaTex.

``` r
iris %>%  
 dplyr::group_by(Species) %>%  
 dplyr::summarise(mean=mean(Sepal.Length)) %>%  
 mypdf1::pdf1_tbl("THIS FUNCTION IS SO INCREDIBLE!")
 ```
 
 ### `pdf1_freq.tbl`
 Essa função auxilia na criação de tabelas de frequência (formato tibble), junto com o template a numeração das tabelas será estruturada automaticamente, as tabelas podem ser referenciadas recorrendo a sintaxe padrão 
do LaTex, para imprimir como tabela no pdf é necessário utilizar `pdf1_tbl`, como segue o exemplo:
``` r
iris %>%
mypdf1::pdf1_freq.tbl(Species,"title") %>%
mypdf1::pdf1_tbl(" You can combine this function too!")
 ```
