#Dependencies
setwd   ("../R Scripts")
source  ("data.R")
require ("ggplot2")

#Arrows on Year x Count for 'key', facet by Gender
p <- function(key, name){
  ggplot(d[d$Gender != "Não divulgável",], aes(x = Year, col = {{key}})) +
    geom_line(stat = "count", alpha = 0.7, linewidth = 1.5, lineend = "round", arrow = arrow(), aes(group = {{key}})) +
    facet_grid(Gender ~ .) +
    labs(title = paste("Candidaturas por",name), x = "Ano", y = "Número de Candidaturas", col = name)
}

p(Region,             "Região")
p(Age,                "Faixa Etária")
p(Civil.State,        "Estado Civil")
p(Education,          "Grau de Instrução")
p(Reelection,         "Reeleição")

ggplot(d[d$Gender != "Não divulgável",], aes(x = Party, fill = Gender)) +
  geom_bar(position = "dodge") +
  facet_grid(Year ~ Spectrum, scales = "free_x") +
  labs(title = "Candidaturas por Partido", x = "Partido", y = "Número de Candidaturas", fill = "Gênero") +
  theme(axis.text.x = element_text(angle = 90))

