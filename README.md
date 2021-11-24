# mypdf1
Sempre quando eu criava algum arquivo em Rmarkdown (principalmente para [Sigma JR](https://www.instagram.com/_sigmajr/)), existia um padrão de pacotes necessários e função que eu quase sempre eram utilizadas.  
Assim esse pacote disponibiliza um template para  relatórios em pdf no Rmarkdown, note que é um pacote  mais *agregador* que criador. 

## Algumas funções já disponíveis
### `pdf1_tbl`
Essa função serve para criação de tabelas, junto com o template a numeração das tabelas será produzida automaticamente, as tabelas podem ser referenciadas utilizando a sintaxe padrão 
do LaTex.

``` r
iris %>%  
 dplyr::group_by(Species) %>%  
 dplyr::summarise(mean=mean(Sepal.Length)) %>%  
 mypdf1::pdf1_tbl("THIS FUNCTION IS SO INCREDIBLE!")
 ```
 
 ### `pdf1_freq.tbl`
 Essa função serve para criação de tabelas de frequência (formato tibble), junto com o template a numeração das tabelas será produzida automaticamente, as tabelas podem ser referenciadas utilizando a sintaxe padrão 
do LaTex, para imprimir como tabela no pdf é necessário utilizar `pdf1_tbl`, como segue o exemplo:
``` r
iris %>%
mypdf1::pdf1_freq.tbl(Species,"title") %>%
mypdf1::pdf1_tbl(" You can combine this function too!")
 ```
