# Instala 'pacman' se necessário
if (!requireNamespace("pacman", quietly = TRUE)) {
  install.packages("pacman")
}

# Usa pacman para instalar e carregar pacotes automaticamente
pacman::p_load(
  fs,        # Criação e manipulação de arquivos e pastas
  here,      # Caminhos relativos seguros
  readr,     # Leitura de arquivos CSV
  dplyr      # Manipulação de dados
)

# Nome do projeto
nome_projeto <- "meu_projeto"

# Cria estrutura básica de pastas
fs::dir_create(path(nome_projeto, c(
  "dados",
  "scripts",
  "output",
  "figuras",
  "docs",
  "funcoes"
)))

# Cria README.md com instruções rápidas
fs::file_create(path(nome_projeto, "README.md"))


# Diretório atual do projeto
here::here()

# Ver quais pastas e arquivos existem
fs::dir_tree(here::here())


# Cria scripts numerados
fs::file_create(path("meu_projeto/scripts", c(
  "01-importacao.R",
  "02-tratamento.R",
  "03-analise.R"
)))



# Cria um vetor com as linhas que queremos escrever no script
linhas_do_script <- c(
  "# Script: 01-importacao.R",
  "# Objetivo: importar e inspecionar os dados iniciais",
  "",
  "library(readr)",
  "library(dplyr)")

writeLines(linhas_do_script, con = "meu_projeto/scripts/01-importacao.R")


# Simula um arquivo CSV com dados numéricos simples
dados_exemplo <- data.frame(
  idade = c(25, 30, 22, 40),
  salario = c(2500, 3200, 2000, 4000)
)

write.csv(dados_exemplo, "meu_projeto/data/dados.csv", row.names = FALSE)



# Cria um data.frame diretamente
dados <- data.frame(
  idade = c(22, 25, 30, 35, 40),
  salario = c(2000, 2500, 3000, 3500, 4000)
)

# Visualiza os dados
print(dados)

# Salva gráfico na pasta figures/
png("meu_projeto/figures/grafico_salario.png", width = 600, height = 400)

# Cria gráfico de dispersão (base R)
plot(
  x = dados$idade,
  y = dados$salario,
  main = "Salário vs Idade",
  xlab = "Idade (anos)",
  ylab = "Salário (R$)",
  pch = 16,        # círculo preenchido
  col = "darkgreen"
)

dev.off()  # Finaliza o arquivo de imagem


library(here)

# Caminho para um arquivo CSV
caminho_csv <- here("meu_projeto", "data", "dados.csv")

library(readr)
library(here)

dados_csv <- read_csv(here("meu_projeto", "data", "dados.csv"))


library(data.table)
