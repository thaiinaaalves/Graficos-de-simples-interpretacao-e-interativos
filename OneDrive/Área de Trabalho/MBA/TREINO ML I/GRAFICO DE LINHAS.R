#grafico de linhas
#nova base filtrada em Brasil, Índia, Rússia e EUA

load("covid_110521.RData")

ggplot(covid_110521)+
  geom_line(aes(x=t, y=cumulative_cases))

#refinando para que cada linha represente um pais
ggplot(covid_110521)+
  geom_line(aes(x=t, y=cumulative_cases, color=country))

#aprimorando
ggplot(covid_110521)+
  geom_line(aes(x=t, y=cumulative_cases, color=country))+
  geom_point(aes(x=t, y=cumulative_cases, color=country))+
  labs(x="Tempo em dias, desde o primeiro caso oficial da Covid19 reportado",
       y="Casos cumulativos",
       color="País")

#suavizacao da variavel'cumulative_cases', visando
#padronizar as informacoes, uma vez que os paises sao
#distintos em populacao, a padronizacao sera em uma
#escala log10
covid_110521["log_cases"] <- log10(covid_110521$cumulative_cases)

ggplot(covid_110521)+
  geom_line(aes(x=t, y=log_cases, color=country))+
  geom_point(aes(x=t, y=log_cases, color=country))+
  labs(x="Tempo em dias, desde o primeiro caso oficial da Covid19 reportado",
       y="Log10 Casos Cumulativos",
       color = "País") 

#utilizando uma proporção da população infectada em razão 
#do tempo passado
covid_110521["pop_cases"] <- covid_110521$cumulative_cases/
  covid_110521$pop

ggplot(covid_110521)+
  geom_line(aes(x=t, y=pop_cases, color=country))+
  geom_point(aes(x=t, y=pop_cases, color=country))+
  labs("Tempo em dias, desde o primeiro caso oficial da Covid19 reportado",
       y="Log10 Casos Cumulativos",
       color = "País")

#valores dos casos por dia e pais, utilizando geometria 'text'
#deslocndo as labels dos valores dos casos cumulativos
#e alterndo o angulo de exibição das labels
ggplot(covid_110521)+
  geom_line(aes(x=t, y=cumulative_cases, color=country))+
  geom_point(aes(x=t, y=cumulative_cases, color=country))+
  geom_text(aes(x=t, y=cumulative_cases, label=cumulative_cases),
            color="black", size=2, vjust=-1, angle=45)+
  labs("Tempo em dias, desde o primeiro caso oficial da Covid19 reportado",
       y="Casos Cumulativos",
       color = "País")

#tentando otimizar deixando o grafico interativo com a funcao ggplotly
ggplotly(
  ggplot(covid_110521)+
  geom_line(aes(x=t, y=cumulative_cases, color=country))+
  geom_point(aes(x=t, y=cumulative_cases, color=country))+
  labs("Tempo em dias, desde o primeiro caso oficial da Covid19 reportado",
       y="Casos Cumulativos",
       color="País")
  
