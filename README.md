# Proyecto Power BI Salud. Censo 2022
## Este proyecto consta de un dashboard en Power BI, que refleja los resultados que arrojados por el Censo 2022 sobre la cobertura de salud de los argentinos, que buscar responder las siguientes preguntas:
#### ¿Cómo se encuentra la situación de cobertura de salud de los argentinos según el censo de 2022?
#### ¿Cuánto es el total de personas con cobertura de salud? ¿Y el total de los que no tienen ninguna?
#### ¿Hay diferencias por provincias?
#### ¿Hay diferencia de cobertura por edades? ¿Y por sexo?
#### En caso de haber diferencias ¿Hay variables que puedan explicar las mismas?

#### Descargué los archivos de cobertura de salud según jurisdicción ("c2022_tp_salud_c1") y cobertura de salud según sexo registrado al nacer y grupos quinquenales de edad ("c2022_tp_salud_c2") del censo desde la página del INDEC, en la sección del Censo 2022, disponible en: https://www.indec.gob.ar/indec/web/Nivel4-Tema-2-41-165


## Dashboard 1:
![dashboard_cobertura1](https://github.com/user-attachments/assets/bba7e249-ee5f-4d11-bfc9-eb5507e153f8)
#### En el primer gráfico de barras apiladas se observan el porcentaje que ocupan las 3 categorías de coberturas sobre su población de cada una de las jurisdicciones de Argentina y del total del país.

#### Haciendo clic en cada barra, podemos dar cuenta de la cantidad y el porcentaje de personas con cada tipo de cobertura. A los costados están las tarjetas que indican, por un lado, la cantidad de personas con obra social, prepaga o PAMI y, por otro lado, la cantidad de personas sin ningún tipo de cobertura. 
![filtro1](https://github.com/user-attachments/assets/03388864-5c65-4b0c-925c-09eb39a0df9b)

![filtro2](https://github.com/user-attachments/assets/faea3842-6031-4fe9-a5c6-d10683c9ce0e)

#### Al costado tenemos una tabla con las 3 provincias con mayor porcentaje de personas sin ningún tipo de cobertura de salud son Formosa, Santiago del Estero y Chaco, con más del 50% de su población en dicha condición. 

![cobertura_edad](https://github.com/user-attachments/assets/87458b57-150f-44ac-a57e-5482e1d27ffe)

#### Con respecto a la edad, el segundo gráfico de barras compara la cantidad de personas que cuentan con obra social, prepaga o PAMI y las que no cuentan con ningún tipo de cobertura, en cada rango quinquenal de edad. 
#### La tarjeta de la izquierda muestra el porcentaje promedio de cada rango de personas menores de 60 años, sin ninguna cobertura de salud
#### A los costados hay tablas con los rangos de edad con menor y mayor porcentaje de cobertura. Se puede observar que los rangos etarios de 20-24 y 25-29 años, más de la mitad no tiene nigún tipo de cobertura, mientras que aquellas personas en edad jubilaoria (mayores a 65 años) tienen un porcentaje de cobertura superior al 90%, debido a la inclusión que genera el Programa de Atención Médica Integral (PAMI) en esa población.
###
## Dashboard 2:
![cobertura2](https://github.com/user-attachments/assets/06132a83-83c7-4ffa-83d7-81ca033d7470)


#### En lo que respecta las diferencias entre los sexos masculinos y femeninos, vemos que no hay grandes desigualdades. Por una mínima diferencia, hay mas mujeres que hombres con obra social, prepaga o PAMI, mientras que dentro de la población sin ningún tipo de cobertura existe una clara paridad entre ambos sexos.

### Gráficos de dispersión
#### De lado derecho del tablero, tenemos dos gráficos de dispersión que correlacionan, por un lado, a la población sin ningún tipo de cobertura de salud y la tasa de actividad (porcentaje entre la población económicamente activa y la población total) de cada distrito y, por otro lado, el porcentaje con algun tipo de cobertura de salud (obra social, prepaga, plan estatal) y la tasa de empleo (porcentaje entre la población ocupada y la población total).
#### La información de dichas tasas están en el dataset es "Mercado de trabajo 2022 INDEC.xlsx" en el repositorio, que corresponden al tercer trimestre del año 2022. Disponible en: https://www.indec.gob.ar/indec/web/Nivel4-Tema-4-31-58 .
![dispersion1](https://github.com/user-attachments/assets/f431ac49-8ff5-4e21-9d58-d649d7193b73)


![dispersion2](https://github.com/user-attachments/assets/126d297a-6c15-4763-bc89-5736ae2aa909)

#### Más allá de algunos outliers (como Santa Cruz y Tierra del Fuego) podemos considerar que existe una correlación entre las tasas de actividad y empleo con el acceso a una cobertura de salud. De esta manera, podemos afirmar que en aquellas provincias/distritos con mayor tasa de actividad y empleo, y, por lo tanto, con un porcentaje mayor de la población con acceso al trabajo, el acceso a una cobertura de salud será mayor y el porcentaje de personas sin cobertura será menor. A mayor posibilidades de obtener empleo, mayores serán las posibilidades de acceder a una cobertura de salud.

#### Otra variable explicativa puede ser el nivel de empleo informal de cada provincia, cuyo dataset está disponible en: https://argendata.fund.ar/graficos/informalidad-por-provincia/ :

![dispersion3](https://github.com/user-attachments/assets/8142a456-8115-48fd-80f7-59c0742abc6f)

#### Esta regresión nos muestra que a mayor nivel de empleo informal en una provincia, mayor será el porcentaje de personas sin ningún tipo de cobertura de salud.

#### Para testear estos modelos de regresión lineal, utilicé R para realizar el test F y calcular el R2 a partir de un modelo de regresión multivariado con las variables tasa de actividad y empleo informal.

![codigo_regresion](https://github.com/user-attachments/assets/70154731-99a0-45c7-9319-3d5c6e2853c4)
![test_bivariado](https://github.com/user-attachments/assets/c7e87087-8b55-4b24-a1b7-a40ba5bdc33d)

#### El P-value es estadísiticamente significativo para un nivel de confianza del 95%, lo cual me indica que las variables nombradas anteriormente explican bien lo que sucede con el porcentaje de personas sin ningun tipo de cobertura de salud. 
#### Por otra parte, el R2 = 0,7263 lo que significa que las variables de actividad y empleo informal, explican en un 72,63% lo que ocurre en el porcentaje de personas sin cobertura.
#### De acuerdo con este modelo, cuando en un distrito de Argentina la tasa de actividad aumente en un 1%, y la tasa de informalidad se mantenga constante, el porcentaje de personas sin cobertura, va a disminuir en un 1,3%. Asimismo, cuando la tasa de informalidad aumente en un 1%, el porcentaje de personas sin cobertura aumentará en un 0,76%, siempre y cuando la tasa de actividad se mantenga constante. 

