library(tidyverse)
library(dplyr)
library(ggplot2)

#####Transformación de datos####
cobertura_trabajo <- read_csv2("cobertura_trabajo.csv")

#creo las columnas de porcentajes que había hecho ya en el Power BI.
porcentaje_obrasocial <- summarise(cobertura_trabajo, porcentaje_obrasocial=((obra_social_prepaga+programas_o_planes_estatales_de_salud)*100)/poblacion_total)
porcentaje_sinobrasocial <- summarise(cobertura_trabajo, porcentaje_sinobrasocial= (no_tiene_obra_social_prepaga_ni_plan_estatal*100)/poblacion_total)

#uno las columnas al dataframe original
cobertura_trabajo <- cbind(cobertura_trabajo, porcentaje_sinobrasocial, porcentaje_obrasocial)

####Regresión de los que no tienen cobertura vs la tasa de actividad####
regresion_sinobrasocial <- lm(porcentaje_sinobrasocial ~ tasa_de_actividad, data = cobertura_trabajo)
summary(regresion_sinobrasocial)

plot_regresion1 <- ggplot(regresion_sinobrasocial,
                          aes(x=tasa_de_actividad, y=porcentaje_sinobrasocial))+
                            geom_point()+
                            geom_smooth(method = "lm")
plot(plot_regresion1)
#En este modelo, cuando la tasa de actividad aumenta en una unidad (1%), el porcentaje de personas sin cobertura de salud disminuye un 2,21%

####regresion de los que tienen obra social vs tasa de empleo####
regresion_obrasocial <- lm(porcentaje_obrasocial ~ tasa_de_empleo, data = cobertura_trabajo)
summary(regresion_obrasocial)
#Según este modelo, cuando en un distrito de Argentina la tasa de empleo aumenta en una unidad (1%) el porcentaje de personas con alguna cobertura de salud aumenta en un 2,38%.

####Regresión bivariada con trabajo informal####
#Agrego el dataset con la tasa de trabajo informal para mejorar el modelo
cobertura_trabajo_informal <- read_csv2('cobertura_trabajo_informal.csv')
head (cobertura_trabajo_informal)

#convierto la columna 'valor' en numerica
cobertura_trabajo_informal [19]<- sapply(cobertura_trabajo_informal [19], as.numeric)

#creo los objetos con los porcentajes de personas con y sin obra social y el porcentaje de personas con trabajo informal
porcentaje_obrasocial_inf <- summarise(cobertura_trabajo_informal, porcentaje_obrasocial_inf=((obra_social_prepaga+programas_o_planes_estatales_de_salud)*100)/poblacion_total)
porcentaje_sinobrasocial_inf <- summarise(cobertura_trabajo_informal, porcentaje_sinobrasocial_inf= (no_tiene_obra_social_prepaga_ni_plan_estatal*100)/poblacion_total)
porcentaje_informalidad <- summarise(cobertura_trabajo_informal, porcentaje_informalidad = valor * 100)

#uno los objetos al dataset
cobertura_trabajo_informal <- cbind(cobertura_trabajo_informal, porcentaje_sinobrasocial_inf, porcentaje_obrasocial_inf, porcentaje_informalidad)

#creo la regresión con los coeficientes y los tests. 
reg_empleo_informal <- lm(porcentaje_sinobrasocial_inf ~ porcentaje_informalidad + tasa_de_actividad,
                                data = cobertura_trabajo_informal)
summary(reg_empleo_informal)
