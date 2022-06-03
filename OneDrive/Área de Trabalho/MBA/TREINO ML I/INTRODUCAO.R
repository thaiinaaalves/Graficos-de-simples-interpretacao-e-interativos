data('mtcars')
head(x = mtcars)
tail(x = mtcars)
str(mtcars)
nrow(mtcars)
ncol(mtcars)
dim(mtcars)
names(mtcars)
mtcars$carb
attach(mtcars)
am
detach(mtcars)
mtcars[1,]
mtcars[2, 4]
mtcars[,c("hp","drat","wt")]
mtcars$var_nova <- NA
head(mtcars)
mtcars$var_nova <- NULL
head(mtcars)
mtcars[1,1] <- gsub(x=mtcars[1,1],
                    pattern = 21.0,
                    replacement = 81.0)
mtcars[1,]
mtcars$cyl <- replace(mtcars$cyl, mtcars$cyl == 6, 10)
mtcars
mtcars <- edit(mtcars)
mtcars[2,]

vetor <- 2
if(vetor>1)
{print ('oi')}
if(vetor>5)
{print ('oi')}
if(vetor>5)
{print ('oi')} else {print ('voltei')}

if(vetor > 8){
  print("O objeto é maior do que 8")
}else if(vetor > 7){
  print("O objeto é maior do que 7")
}else if(vetor > 6){
  print("O objeto é maior que 6")
}else if(vetor > 5){
  print("O objeto é maior do 5")
} else {
  print("O objeto é maior do que 4")
}

vetor <- 7
if(vetor>8){
  print('o objeto é maior que 8')
}else if(vetor>7){
  print('o objeto é maior que 7')
}else if(vetor>6){
  print('o objeto é maior que 6')
}else if(vetor>5){
  print('o objeto é maior que 5')
}else{
  print('o objeto é maior que 4')
}

ifelse{(vetor==7,
        yes = 'o objeto é igual a 7'
        no = 'o objeto é diferente de 7') 
} 

y <- 10
for(i in 1:5){
  print(y+i)
}

vetor_regioes <- c('norte','nordeste','sul','suldeste','centro-oeste')
for (regiao in vetor_regioes){
  print(regiao)
}

z <- 0
while(z<10){
  print (z)
  z <- z+1
}
