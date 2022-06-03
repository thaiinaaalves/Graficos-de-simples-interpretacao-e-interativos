#boxplot
#conversao da base no formato long
load("atlas_ambiental.RData")
atlas_log <- melt(atlas_ambiental[, 2:11], id.vars="distritos")
head(atlas_log)
tail(atlas_log)

ggplot(atlas_log)+
  geom_boxplot(aes(x=variable, y=value, fill=variable))

#padronizando as variaveis com zscores
atlas_padronizado <- atlas_ambiental
atlas_padronizado[,3:11] <- scale(atlas_padronizado[,3:11])
head(atlas_padronizado)
tail(atlas_padronizado)

atlas_padronizado_long <- melt(atlas_padronizado[,2:11],
                               id.vars="distritos")
head(atlas_padronizado_long)
tail(atlas_padronizado_long)

#criando grafico interativo com ggplotly()
ggplotly(
  ggplot(atlas_padronizado_long)+
    geom_boxplot(aes(x=variable, y=value, fill=variable))+
    labs(x="Variáveis",
         y="Valores")+
    theme(panel.background=element_rect("white"),
          panel.grid=element_line("grey85"),
          panel.border=element_rect(NA),
          legend.position="bottom",
          axis.text.x=element_text(angle=0)))
)