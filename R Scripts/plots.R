#Dependencies
setwd   ("../R Scripts")
source  ("data.R")
require ("ggplot2")

#Count by Year - Line
ggplot(d[d$Gender  != "Não divulgável",],
       aes(x        = Year,
           col      = Spectrum)) +
  
  geom_line(stat = "count",
            alpha = 0.8,
            linewidth = 1.5,
            lineend = "round",
            arrow = arrow(),
            aes(group = Spectrum)) +
  facet_grid(Gender ~ .) +
  
  labs(
    title = "Candidaturas por Posição no Espectro Político",
    x     = "Ano",
    y     = "Número de Candidaturas",
    fill  = "Posição no Espectro Político"
  )
