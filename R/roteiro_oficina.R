
# Objetos -----------------------------------------------------------------

objeto <- 10

objeto

# Permitido

x <- 1
X <- 5
x1 <- 2
objeto23 <- 3
meu_objeto <- 4
meu.objeto <- 5

# Não permitido

1objeto <- 1
_objeto <- 2
meu-objeto <- 3

# Operações com objetos

minha_idade <- 33
idade_meses <- minha_idade * 12
idade_dias <- idade_meses * 30

#### Classes dos objetos ####

1 + 1
"a" + "b"

a <- 10
a
"a"
obj <- "a"

class(a)
class(obj)
class(mtcars)

# texto, string, character, caracteres
"a"
"1"
"positivo"

# número, valor real, numeric, double
1
0.10
0.95
pi

# lógico, logical, booleano, valor TRUE/FALSE
TRUE
FALSE

1 == 1
1 == 2
1 > 2
1 != 1

# Dataframes --------------------------------------------------------------

mtcars

df <- mtcars

#### Vetores ####

mpg <- df$mpg

vetor1 <- c(1, 5, 3, -10)
vetor2 <- c("a", "b", "c")
vetor3 <- 1:10

# os valores dentro de um vetor são indexados de acordo com sua posição

vetor1[2]
vetor2[3]
vetor3[8]
vetor1[c(1, 4)] # selecionando um conjunto de índices (subsetting)
vetor3[c(3, 1)]
vetor2[5]

# um vetor só pode conter um tipo de objeto

class(vetor1)
class(vetor2)

# coerção de vetores

vetor <- c(1, 2, "a")
vetor
class(vetor)

# operações com vetores

vetor <- c(0, 5, 20, -3)
vetor + 1
vetor - 1
vetor / 2
vetor * 10

# vetorização

vetor1 <- c(1, 2, 3)
vetor2 <- c(10, 20, 30)

vetor1  + vetor2

# reciclagem
# o primeiro verto foi repetido
# É como se o primeiro vetor fosse na verdade c(1, 2, 1, 2).

vetor1 <- c(1, 2)
vetor2 <- c(10, 20, 30, 40)

vetor1 + vetor2

# operador %in%

3 %in% c(1, 2, 3)

#### Listas ####

lista <- list(1, "a", TRUE)

lista[1]

class(lista[1]) # cada elemento de uma lista também é uma lista

lista[[1]] # para selecionar o elemento, precisamos do colchetes

class(lista[[1]])

lista <- list(1:3, "a", c(TRUE, TRUE, FALSE, FALSE))

# atribuir nomes para cada posição de uma lista

dados_processo <- list(reu = "João da Silva", idade = 25, cor = "branco")

dados_processo$idade
dados_processo[1]

#### Dataframes como listas ####

as.list(mtcars)

mtcars$mpg # operador $ para acessar cada elemento da lista (cada coluna do data frame)

mtcars[1] # cada elemento do dataframe também é um dataframe

# visualizando uma lista como um dataframe

dados_cliente <- list(
  cliente = c("Ana Silva", "Beto Pereira", "Carla Souza"),
  idade = c(25, 30, 23),
  estado_civil = c(NA, "Solteiro", "Casada")
)

dados_cliente

as.data.frame(dados_cliente)

# Funções -----------------------------------------------------------------

1+3+6789

sum(1,3,6789)

soma <- sum(1,3,6789)

mean(1, 3) # só considera o primeiro número na média

mean(c(1, 3)) # considera todos os valores dentro do vetor na média

length(vetor3)

paste("eu gosto de", "frutas")

mean(mtcars$mpg) # calcular a média dos valores de uma coluna

# Funções nativas do R-base

head(mtcars) # Mostra as primeiras 6 linhas.
tail(mtcars) # Mostra as últimas 6 linhas.
dim(mtcars) # Número de linhas e de colunas.
names(mtcars) # Os nomes das colunas (variáveis).
str(mtcars) # Estrutura do data frame.
cbind() # une duas tabelas lado a lado
rbind() # empilha duas tabelas

# Criar funções

nome_da_funcao <- function(argumento_1, argumento_2) {

  # Código que a função irá executar

}

funcao_somar <- function(x, y) {
  soma <- x + y

  soma  # resultado retornado
}

funcao_somar(356,895)

retornar_maior <- function(x, y) {
  max(x, y)
}

retornar_maior(10, 20)


# Controle de fluxo -------------------------------------------------------

#### IF ####

x <- 2
x <- 1

if (x == 1) {
  Sys.time()
}


x <- c(1, 3, 10, 15)
x <- c("a", "b", "c")

if (class(x) == "numeric") {
  sum(x)
}


# Devolvendo um resultado antecipadamente
minha_soma_NA <- function(x, y) {
  if (class(x) == "numeric" & class(y) == "numeric") {
    soma <- x + y
    return(soma)
  }

  NA
}


minha_soma_NA(1, 2)
minha_soma_NA("a", "b")
minha_soma_NA(1, "b")

#### ELSE ####

x <- c(1, 3, 10, 15)
x <- c(1, 3, 10, "15")

if (class(x) == "numeric") {
  sum(x)
} else {
  NA
}


#### FOR ####

# o objeto coluna é o iterador

numero_de_colunas <- ncol(mtcars)

for (coluna in 1:numero_de_colunas) {
  media <- mean(mtcars[,coluna])

  print(media)
}

#### WHILE ####

i <- 1

while (i < 8){
  print(i)
  i <-  i + 1
}


# Instalando pacotes ------------------------------------------------------

# Via CRAN
install.packages("tidyverse")
install.packages("devtools")

# Via GitHub
devtools::install_github("courtsbr/esaj")
devtools::install_github("jjesusfilho/tjsp")

# carregando pacotes
library(devtools)
library(esaj)
library(tjsp)

# Obtendo ajuda -----------------------------------------------------------

?esaj::download_cjsg # ler a documentação da função
?tjsp::baixar_cjsg

args(esaj::download_cjsg) # obter os argumentos de uma função

# Importação --------------------------------------------------------------

library(readr)
library(dplyr)

getwd() # obter working directory

setwd("/cloud/project") # definir working directory

imdb_csv <- read_csv(file = "data/imdb.csv")

# Base de dados processuais -----------------------------------------------

# baixando julgados de segundo grau

?tjsp::baixar_cjsg # ler a documentação da função

# argumentos
busca <- "algoritmo"

dir.create("data-raw")
dir.create("data-raw/cjsg")
dir <- "/cloud/project/data-raw/cjsg"

# rodando a query
tjsp::baixar_cjsg(livre = busca, diretorio = dir)

args(tjsp::baixar_cjsg)

tjsp::baixar_cjsg(livre = busca, diretorio = diretorio,
                  inicio = "01/01/2021", fim = "08/11/2021")
tjsp::baixar_cjsg(livre = busca, diretorio = diretorio,
                  inicio = "01/01/2021", fim = "08/11/2021",
                  orgao_julgador = "0-1149") #1ª Câmara Reservada de Direito Empresarial

# parseamento
consulta <- tjsp::ler_cjsg(diretorio = dir)


# Manipulação -------------------------------------------------------------

library(dplyr)
library(tidyr)
library(tibble)
library(stringr)

#### dplyr ####

# seleção
select(consulta,relator, comarca)
select(consulta,relator:processo)
select(consulta, starts_with("data"))

# ordenação
arrange(consulta, data_julgamento)
arrange(consulta, data_publicacao)
arrange(consulta, desc(data_julgamento))

# encadeamento com pipe %>%
consulta %>%
  arrange(data_julgamento) %>%
  select(relator, comarca)

# filtro
consulta %>% filter(data_julgamento > "2021-07-01")
consulta %>% filter(data_julgamento > "2021-07-01", data_publicacao > "2021-08-01")

consulta %>%
  filter(comarca %in% c("São Paulo", "Diadema"))

# modificação/criação de colunas
consulta_alt <- consulta %>% mutate(lapso = data_publicacao-data_julgamento)

# resumir
consulta_alt %>% summarize(media_lapso = mean(lapso, na.rm = TRUE))

consulta_alt %>% summarise(
  media_lapso = mean(lapso, na.rm = TRUE),
  mediana_lapso = median(lapso, na.rm = TRUE),
  variancia_lapso = var(lapso, na.rm = TRUE)
) # resume uma única coluna

consulta_alt %>%
  group_by(comarca) %>%
  summarise(media_lapso = mean(lapso, na.rm = TRUE))
# resume uma coluna agrupada pelas categorias de uma segunda coluna

#### stringr ####

# str_length
str_length("São Paulo")
str_length(c("São Paulo", "Rio de Janeiro",
             "Rio Grande do Norte", "Acre"))

# maiúsculas e minúsculas
s <- "cUrso de METODOLOGIA da Pesquisa EmpírICA em Direito"
str_to_lower(s)
str_to_upper(s)
str_to_title(s)

# remoção de espaços
s <- c("M", "F", "F", " M", " F ", "M")
as.factor(s)
string_aparada <- str_trim(s)
as.factor(string_aparada)

# sub string
s <- c("01-Feminino", "02-Masculino", "03-Indefinido")

str_sub(s, start = 4) # pegar do quarto até o último caractere
str_sub(s, end = 2) # pegar apenas os dois primeiros caracteres
str_sub(s, start = -2) # pegar os últimos 2 caracteres


# Visualização ------------------------------------------------------------

library(ggplot2)

# gráfico de dispersão

ggplot(consulta_alt) +
  geom_point(mapping = aes(x = data_julgamento, y = lapso))


# gráfico de linhas

consulta_alt %>%
  group_by(data_julgamento) %>%
  summarise(media_lapso = mean(lapso, na.rm = TRUE)) %>%
  ggplot() +
  geom_line(aes(x = data_julgamento, y = media_lapso))

consulta_alt %>%
  filter(comarca == "São Paulo") %>%
  group_by(data_julgamento) %>%
  summarise(media_lapso = mean(lapso, na.rm = TRUE)) %>%
  ggplot() +
  geom_line(aes(x = data_julgamento, y = media_lapso))

# gráfico de barras

consulta_alt %>%
  count(comarca) %>%
  top_n(10, n) %>%
  ggplot() +
  geom_col(aes(x = comarca, y = n)) +
  labs(
    x = "Comarca",
    y = "Número de processos julgados",
    title = "Total de processos julgados",
    subtitle = "Citação ao termo algoritmo"
  )
