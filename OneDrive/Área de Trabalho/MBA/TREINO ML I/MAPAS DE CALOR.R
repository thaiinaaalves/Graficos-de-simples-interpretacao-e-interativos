#mapas de calor
#para a criação do grafico de calor de forma adequada, irei estabecer
#previamente uma Matriz de Correlação, com a funcao cor()

load("atlas_ambiental.RData")

matriz_correlacoes <- cor(atlas_ambiental[,3:11])
matriz_correlacoes

#mudando o formato da base de long para wide, com a funcao melt()
#para otimizacao do grafico de calor
correlacoes <- melt(matriz_correlacoes)
head(correlacoes)
tail(correlacoes)
names(correlacoes) <- c("var1", "var2", "correlacao")

#criando
ggplot(correlacoes)+
  geom_tile(aes(x=var1, y=var2, fill=correlacao))

#criando gradiente de cores
ggplot(correlacoes)+
  geom_tile(aes(x=var1, y=var2, fill=correlacao))+
            labs(x=NULL, y=NULL, fill="Correlações")+
  scale_fill_gradient2(low="darkblue",
                       mid="white",
                       high="darkred",
                       midpoint=0)

#colocando os valores arredondados dentro de seus
#respectivos quadrados, com a funcao round()
ggplot(correlacoes)+
  geom_tile(aes(x=var1, y=var2, fill=correlacao))+
  geom_text(aes(x=var1, y=var2, label=round(correlacao, 
                                            digits = 3)), 
                size=3)+
  labs(x=NULL, y=NULL, fill="Correlações")+
  scale_fill_gradient2(low="darkblue",
                       mid="white",
                       high="darkred",
                       midpoint=0)

#utilizando o ggplotly()
ggplotly(
  ggplot(correlacoes)+
    geom_tile(aes(x=var1, y=var2, fill=correlacao))+
    geom_text(aes(x=var1, y=var2, label=round(correlacao,
                                              digits=3)),
              size=3)+
    labs(x=NULL, y=NULL, fill="Correlações")+
    scale_fill_gradient2(low="darkblue",
                         mid="white",
                         high="darkred",
                         midpoint=0)+
    theme(panel.background=element_rect("white"),
          panel.grid=element_line("grey85"),
          panel.border=element_rect(NA),
          legend.position="bottom",
          axis.text.x=element_text(angle=0)))
