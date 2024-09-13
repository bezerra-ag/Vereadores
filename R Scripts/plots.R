#Dependencies
setwd   ("../R Scripts")
source  ("data.R")
require ("ggplot2")

#Count by Gender - Line
ggplot(d[d$Gender    != "Não divulgável",],
       aes(x          = Year,
           col        = Gender)) +
  geom_line(stat      = "count",
            alpha     = 0.7,
            linewidth = 1.5,
            lineend   = "round",
            arrow     = arrow(),
            aes(group = Gender)) +
  labs(
    title = "Candidaturas por Gênero",
    x     = "Ano",
    y     = "Número de Candidaturas",
    col   = "Gênero"
  )

#Count by Spectrum - Line
ggplot(d[d$Gender  != "Não divulgável",],
       aes(x        = Year,
           col      = Spectrum)) +
  
  geom_line(stat      = "count",
            alpha     = 0.7,
            linewidth = 1.5,
            lineend   = "round",
            arrow     = arrow(),
            aes(group = Spectrum)) +
  facet_grid(Gender ~ .) +
  
  labs(
    title = "Candidaturas por Posição no Espectro Político",
    x     = "Ano",
    y     = "Número de Candidaturas",
    col   = "Posição no Espectro Político"
  )

#Count by the Liberal Party - Line
ggplot(d[d$Gender    != "Não divulgável" & (d$Party == "PL" | d$Party == "PR"),],
       aes(x          = Year,
           col        = Gender)) +
  geom_line(stat      = "count",
            alpha     = 0.7,
            linewidth = 1.5,
            lineend   = "round",
            arrow     = arrow(),
            aes(group = Gender)) +
  labs(
    title = "Candidaturas pelo Partido Liberal",
    x     = "Ano",
    y     = "Número de Candidaturas",
    col   = "Gênero"
  )
