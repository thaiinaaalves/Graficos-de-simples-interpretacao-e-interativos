load("dados_sp.RData")

#criando histograma
ggplot(data=dados_sp)+
  geom_histogram(aes(x=idh))

#colorindo
ggplot(data=dados_sp)+
  geom_histogram(aes(x=idh), fill="blue1")
#contornos e legendas
ggplot(data=dados_sp)+
  geom_histogram(aes(x=idh), fill="blue1", 
                 color="black")+ labs(x="IDH dos Munícipios de São Paulo",
                                      y="Frequência")
#ajustando quantidade de caixas
ggplot(data=dados_sp)+
  geom_histogram(aes(x=idh), fill="blue1",
                 color="black", bins=100)+ labs(x="IDH dos Munícipios de São Paulo",
                                      y="Frequência")

