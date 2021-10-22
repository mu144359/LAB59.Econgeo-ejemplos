# Hecho con gusto por Selene Muñoz Ortega (UAEH)

# LABORATORIO 59 - Econgeo

# instalar librerias
install.packages("devtools") #or
install.packages("devtools", type = "win.binary")
library(devtools)
devtools::install_github("PABalland/EconGeo", force = T)

# llamar librerias
library (EconGeo)

#####################################
# 1. Graficar una curva de Hoover   #
#####################################

# generar vectores sobre estadistica industrial y poblacional

ind <- c(0, 10, 10, 30, 50)
pop <- c(10, 15, 20, 25, 30)

# ver el vector ind
ind

# ver el vector pop
pop

# correr la funcion (30% de la poblacion produce 50% de los resultados industriales)
Hoover.curve (ind, pop)

# calcular el Gini correspondiene al indice Hoover
Hoover.Gini (ind, pop)


##############
# 2. GINI    #
##############

# generar vectores de conteo industrial
ind <- c(0, 10, 10, 30, 50)

# correr la funcion
Gini (ind)

# generar una matriz region - industria
mat1 = matrix (
  c (0, 1, 0, 0,
     0, 1, 0, 0,
     0, 1, 0, 0,
     0, 1, 0, 1,
     0, 1, 1, 1), ncol = 4, byrow = T)
rownames(mat1) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat1) <- c ("I1", "I2", "I3", "I4")

# correr la funcion
Gini (mat1)

# correr la funcion agregando todas las industrias
Gini (rowSums(mat1))

# correr la funcion solo para la industria 1 (igualdad perfecta)
Gini (mat1[,1])

# correr la funcion solo para la industria 2 (igualdad perfecta)
Gini (mat1[,2])

# correr la funcion solo para la industria 3 (desigualdad perfecta: max Gini = (5-1)/5)
Gini (mat1[,3])

# correr la funcion solo para la industria 4 (top 40% produce el 100% de los resultados)
Gini (mat1[,4])


######################
# 3. HOOVER. GINI    #
######################

# generar vectores de estadistica industrial y poblacional
ind <- c(0, 10, 10, 30, 50)
pop <- c(10, 15, 20, 25, 30)

# correr la funcion (30% de la poblacion produce el 50% de los resultados industriales)
Hoover.Gini (ind, pop)

# generar una matriz region - industria
mat2 = matrix (
  c (0, 10, 0, 0,
     0, 15, 0, 0,
     0, 20, 0, 0,
     0, 25, 0, 1,
     0, 30, 1, 1), ncol = 4, byrow = T)
rownames(mat2) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat2) <- c ("I1", "I2", "I3", "I4")

# correr la funcion
Hoover.Gini (mat2, pop)

# correr la funcion agregando todas las industrias
Hoover.Gini (rowSums(mat2), pop)

# correr la funcion solo para la industria 1 
Hoover.Gini (mat2[,1], pop)

# correr la funcion solo para la industria 2 (perfectamente proporcional a la poblacion)
Hoover.Gini (mat2[,2], pop)

# correr la funcion solo para la industria 3 (30% de la poblacion produce el 100% de la produccion)
Hoover.Gini (mat2[,3], pop)

# correr la funcion solo para la industria 4 (55% del poblacion produce el 100% de la produccion)
Hoover.Gini (mat2[,4], pop)


########################
# 4. LOCATIONAL.GINI   #
########################

# generar una matriz region - industria
mat3 = matrix (
  c (100, 0, 0, 0, 0,
     0, 15, 5, 70, 10,
     0, 20, 10, 20, 50,
     0, 25, 30, 5, 40,
     0, 40, 55, 5, 0), ncol = 5, byrow = T)
rownames(mat3) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat3) <- c ("I1", "I2", "I3", "I4", "I5")

# correr la funcion
locational.Gini (mat3)

##############################
# 5. LOCATIONAL.GINI.CURVE   #
##############################

# generar una matriz region - industria
mat3 = matrix (
  c (100, 0, 0, 0, 0,
     0, 15, 5, 70, 10,
     0, 20, 10, 20, 50,
     0, 25, 30, 5, 40,
     0, 40, 55, 5, 0), ncol = 5, byrow = T)
rownames(mat3) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat3) <- c ("I1", "I2", "I3", "I4", "I5")

# correr la funcion (mostrar industria #5)
locational.Gini.curve (mat3)
locational.Gini.curve (mat3, pdf = TRUE)


########################
# 6. LORENZ.CURVE      #
########################

# generar vectores de estadistica industrial
ind <- c(0, 10, 10, 30, 50)

# correr la funcion
Lorenz.curve (ind)
Lorenz.curve (ind, pdf = TRUE)
Lorenz.curve (ind, plot = FALSE)

# generar una matriz region - industria
mat1 = matrix (
  c (0, 1, 0, 0,
     0, 1, 0, 0,
     0, 1, 0, 0,
     0, 1, 0, 1,
     0, 1, 1, 1), ncol = 4, byrow = T)
rownames(mat1) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat1) <- c ("I1", "I2", "I3", "I4")

# correr la funcion
Lorenz.curve (mat1)
Lorenz.curve (mat1, pdf = TRUE)
Lorenz.curve (mat1, plot = FALSE)

# correr la funcion agregando todas las industrias
Lorenz.curve (rowSums(mat1))
Lorenz.curve (rowSums(mat1), pdf = TRUE)
Lorenz.curve (rowSums(mat1), plot = FALSE)

# correr la funcion solo para la industria 1 (igualdad perfecta)
Lorenz.curve (mat1[,1])
Lorenz.curve (mat1[,1], pdf = TRUE)
Lorenz.curve (mat1[,1], plot = FALSE)

# correr la funcion solo para la industria 2 (igualdad perfecta)
Lorenz.curve (mat1[,2])
Lorenz.curve (mat1[,2], pdf = TRUE)
Lorenz.curve (mat1[,2], plot = FALSE)

# correr la funcion solo para la industria 3 (desigualdad perfecta)
Lorenz.curve (mat1[,3])
Lorenz.curve (mat1[,3], pdf = TRUE)
Lorenz.curve (mat1[,3], plot = FALSE)

# correr la funcion solo para la industria 4 (el top 40% produce el 100% de los resultados)
Lorenz.curve (mat1[,4])
Lorenz.curve (mat1[,4], pdf = TRUE)
Lorenz.curve (mat1[,4], plot = FALSE)

# comparar la distribucion de las industrias
par(mfrow=c(2,2))
Lorenz.curve (mat1[,1])
Lorenz.curve (mat1[,2])
Lorenz.curve (mat1[,3])
Lorenz.curve (mat1[,4])
