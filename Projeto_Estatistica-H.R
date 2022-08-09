install.packages("dplyr")
library("dplyr")



#Dataframe
df <- read.csv("Dados_p_modeloR")

#Selecionando as variaveis qualitativas
Escolaridade <- select(df,Escolaridade)
Classesocial <- select(df,Classe.social)
Sexo <- select(df,Sexo)
Estadocivil <- select(df,Estado.civil)

#Calculando porcentagem de cada variavel dentro das variaveis qualitativas
#Escolaridade
  EMI <- count(filter(Escolaridade, Escolaridade == "Ensino medio incompleto"))/count(Escolaridade)*100
  EMC <- count(filter(Escolaridade, Escolaridade == "Ensino medio completo"))/count(Escolaridade)*100
  ESI <- count(filter(Escolaridade, Escolaridade == "Ensino superior incompleto"))/count(Escolaridade)*100
  ESC <- count(filter(Escolaridade, Escolaridade == "Ensino superior completo"))/count(Escolaridade)*100
  

#Classe social
Baixa <- count(filter(Classesocial, Classe.social == "Baixa"))/count(Classesocial)*100
Media <- count(filter(Classesocial, Classe.social == "Media"))/count(Classesocial)*100
Alta <- count(filter(Classesocial, Classe.social == "Alta"))/count(Classesocial)*100

#Sexo
Masculino <- count(filter(Sexo, Sexo == "Masculino"))/count(Sexo)*100
Feminino <- count(filter(Sexo, Sexo == "Feminino"))/count(Sexo)*100
   
#Estado civil
Solteiro <- count(filter(Estadocivil, Estado.civil == "Solteiro"))/count(Estadocivil)*100
Namorando <- count(filter(Estadocivil, Estado.civil == "Namorando"))/count(Estadocivil)*100
Casado <- count(filter(Estadocivil, Estado.civil == "Casado"))/count(Estadocivil)*100
Divorciado <- count(filter(Estadocivil, Estado.civil == "Divorciado"))/count(Estadocivil)*100

Solteiro
Namorando
Casado
Divorciado

#Selecionando as variaveis quantitativas
ncomp <- sort(select(df,Numero.computaores)$Numero.computaores)
nanimal <- sort(select(df,Numero.animais.estimação)$Numero.animais.estimação)
nfilhos <- sort(select(df,Numero.filhos)$Numero.filhos)
idade <- sort(select(df,Idade)$Idade)
peso <- sort(select(df,Peso)$Peso)
altura <- as.numeric(sub(",", ".", (sort(select(df,Altura)$Altura)), fixed = TRUE))

#Fazendo as contas com as variaveis quantitativas

#Obtendo a média das variaveis
Mncomp <- mean(ncomp)
Mnanimal <- mean(nanimal)
Mnfilhos <- mean(nfilhos)
Midade <- mean(idade)
Mpeso <- mean(peso)
Maltura <- mean(altura)

#Obtendo a mediana das variaveis
Medncomp <- median(ncomp)
Mednanimal <- median(nanimal)
Mednfilhos <- median(nfilhos)
Medidade <- median(idade)
Medpeso <- median(peso)
Medaltura <- median(altura)

#Obtendo Q1 das variaveis
Q1ncomp <- quantile(ncomp, 0.25)
Q1nanimal <- quantile(nanimal, 0.25)
Q1nfilhos <- quantile(nfilhos, 0.25)
Q1idade <- quantile(idade, 0.25)
Q1peso <- quantile(peso, 0.25)
Q1altura <- quantile(altura, 0.25)

#Obtendo Q3 das variaveis
Q3ncomp <- quantile(ncomp, 0.75)
Q3nanimal <- quantile(nanimal, 0.75)
Q3nfilhos <- quantile(nfilhos, 0.75)
Q3idade <- quantile(idade, 0.75)
Q3peso <- quantile(peso, 0.75)
Q3altura <- quantile(altura, 0.75)

#Obtendo a variancia das variaveis
Varncomp <- var(ncomp)
Varnanimal <- var(nanimal)
Varnfilhos <- var(nfilhos)
Varidade <- var(idade)
Varpeso <- var(peso)
Varaltura <- var(altura)

#Obtendo o desvio padrão das variaveis
Dpncomp <- sd(ncomp)
Dpnanimal <- sd(nanimal)
Dpnfilhos <- sd(nfilhos)
Dpidade <- sd(idade)
Dppeso <- sd(peso)
Dpaltura <- sd(altura)

#Graficos
#Grafico pizza - Escolaridade
e1 <- unique(Escolaridade)
e2 <- c(sort(EMI$n),sort(EMC$n),sort(ESI$n),sort(ESC$n))
pie(e2, labels = e1$Escolaridade, main = "Percentual de escolaridade")

#Grafico pizza - Sexo
s1 <- unique(Sexo)
s2 <- c(sort(Masculino$n), sort(Feminino$n))
pie(s2, labels = s1$Sexo, main = "Percentual de sexo")

#Grafico pizza - Classe social
cs1 <- unique(Classesocial)
cs2 <- c(sort(Media$n), sort(Baixa$n), sort(Alta$n))
pie(cs2, labels = cs1$Classe.social, main = "Percentual de Classe social")

#Grafico pizza - Estado civil
ec1 <- unique(Estadocivil)
ec2 <- c(sort(Solteiro$n), sort(Namorando$n), sort(Casado$n), sort(Divorciado$n))
pie(ec2, labels = ec1$Estado.civil, main = "Percentual de Estado civil")


#Grafico barra - Classe social e escolaridade

my_colors <- c("darkblue", "red", "violet", "green")
ce <- table(Escolaridade$Escolaridade, Classesocial$Classe.social)
barplot(ce, main = "Relação classe social com escolaridade", 
        col=c("darkblue", "red", "violet", "green"), beside =TRUE, density = 20)
legend("topleft", legend = rownames(ce), 
       fill = my_colors, box.lty = 0, cex = 0.9, density = 30)

#Grafico histograma - Altura

hist(altura,breaks = 10, xlab = "Altura", ylab = "Numero de pessoas", 
     main = "Grafico de altura", density = 20, col = "darkblue")

#Grafico histograma - Peso

hist(peso, breaks = 7, xlab = "Peso", ylab = "Numero de pessoas", col = "steelblue")

#Grafico de dispersão - Altura-Peso

plot(altura, peso, main = "Grafico de dispersão Altura-Peso", xlab = "Altura", ylab = "Peso", pch = 19)
lines(lowess(altura,peso), col="blue")

#Grafico de dispersão de Idade-numero de filhos

plot(idade, nfilhos, main = "Grafico de dispersão Idade-N° de filhos", 
     xlab = "Idade", ylab = "N° de filhos", pch = 19)
lines(lowess(idade,nfilhos), col="blue")

#Grafico Box-plot de Numero de computadores, numero de animais e de filhos em casa.

my_colors2 <- c("blue", "yellow", "red")
nomeslegendabox <- c("N°computador","N°animal","N°filhos")
boxplot(ncomp, nanimal, nfilhos, horizontal = TRUE, frame = FALSE,xlab = "Numero de Filhos", ylab = "Computador      Animal      Filhos",
        border = c("blue", "yellow", "red"))





