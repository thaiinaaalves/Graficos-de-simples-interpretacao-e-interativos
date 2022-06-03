#grafico de pontos
load("atlas_ambiental.RData")

ggplot(data=atlas_ambiental)+
  geom_point(aes(x=renda, y=escolaridade))

#estatificando dados com o uso do size and color
ggplot(data=atlas_ambiental)+
  geom_point(aes(x=renda, y=escolaridade, size=idade,
                 color=favel <6))

#adicionando o argumento shape e legendas
ggplot(data=atlas_ambiental)+
  geom_point(aes(x=renda, y=escolaridade, size=idade,
                 color=favel <6, shape=mortalidade >18))+
  labs(title="Indicadores do Distrito de São Paulo",
       x="Renda",
       y="Escolaridade")

#traçando linha de tendêndencias
ggplot(data=atlas_ambiental)+
  geom_point(aes(x=renda, y=escolaridade, size=idade,
                 color=favel <6, shape=mortalidade >18))+
  geom_smooth(aes(x=renda, y=escolaridade),
              method = "loess", se= FALSE)+
  labs(title = "Indicadores do Distrito de São Paulo",
       x="Renda",
       y="Escolaridade")

#nova base de dados
load("fisman_miguel")
ggplot(fisman_miguel)+
  geom_point(aes(x=corruption, y=violations))+
  geom_smooth(aes(x=corruption, y=violations),
              se=FALSE,
              method="loess")+
  geom_text(aes(x=corruption, y=violations, label=code))

#refinando o gráfico
ggplot(fisman_miguel)+
  geom_point(aes(x=corruption, y=log(violations)))+
  geom_smooth(aes(x=corruption, y=log(violations)),
              se=F,
              method="loess")+
  geom_text(aes(x=corruption, y=log(violations), label=code))

#minimizando problema com dupla contagem
ggplot(fisman_miguel)+
  geom_point(aes(x=corruption, y=log(violations)))+
  geom_smooth(aes(x=corruption, y=log(violations)),
              se=F,
              method="loess")+
  geom_text(aes(x=corruption, y=log(violations), label=code))+
  facet_wrap(~post)

#amenizando a sobreposição de labels 
ggplot(fisman_miguel)+
  geom_point(aes(x=corruption, y=log(violations)))+
  geom_smooth(aes(x=corruption, y=log(violations)),
              se=F,
              method="loess")+
  geom_text_repel(aes(x=corruption, y=log(violations), label=code))+
  facet_wrap(~post)