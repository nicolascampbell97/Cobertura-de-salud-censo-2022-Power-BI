# Proyecto Power BI Salud. Censo 2022
## Este proyecto consta de un dashboard en Power BI, que refleja los resultados que arrojados por el Censo 2022 sobre la cobertura de salud de los argentinos, que buscar responder las siguientes preguntas:
#### 1. ¿Cómo se encuentra la situación de cobertura de salud de los argentinos según el censo de 2022?
#### 2. ¿Cuánto es el total de personas con cobertura de salud? ¿Y el total de los que no tienen ninguna?
#### 3. ¿Hay diferencias por provincias?
#### 4. ¿Hay diferencia de cobertura por edades? ¿Y por sexo?
#### 5. En caso de haber diferencias ¿Hay variables que puedan explicar las mismas?

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
![dashboard_cobertura2](https://github.com/user-attachments/assets/7c9247f0-a140-4557-a5db-9d149b0e84f6)

#### En lo que respecta las diferencias entre los sexos masculinos y femeninos, vemos que no hay grandes desigualdades. Por una mínima diferencia, hay mas mujeres que hombres con obra social, prepaga o PAMI, mientras que dentro de la población sin ningún tipo de cobertura existe una clara paridad entre ambos sexos.

### Gráficos de dispersión
#### De lado derecho del tablero, tenemos dos gráficos de dispersión que correlacionan, por un lado, a la población sin ningún tipo de cobertura de salud y la tasa de actividad (porcentaje entre la población económicamente activa y la población total) de cada distrito y, por otro lado, el porcentaje con algun tipo de cobertura de salud (obra social, prepaga, plan estatal) y la tasa de empleo (porcentaje entre la población ocupada y la población total).
#### La información de dichas tasas están en el dataset es "Mercado de trabajo 2022 INDEC.xlsx" en el repositorio, que corresponden al tercer trimestre del año 2022. Disponible en: https://www.indec.gob.ar/indec/web/Nivel4-Tema-4-31-58 .

![dispersión1](https://github.com/user-attachments/assets/fc316843-4c9e-4cac-ab8b-fcd4708dba01)
![dispersion2](https://github.com/user-attachments/assets/ff7c0a4f-b530-41c4-a1d6-ea06acbb2fcf)


#### Más allá de algunos outliers (Ciudad Autónoma de Buenos Aires y Formosa) podemos considerar que existe una correlación entre las tasas de actividad y empleo con el acceso a una cobertura de salud. Afirmando así que en aquellas provincias/distritos con mayor tasa de actividad y empleo, por lo tanto, con un porcentaje mayor de la población con acceso al trabajo, el acceso a una cobertura de salud (obra social, prepaga o programa/plan estatal) será mayor y el porcentaje de personas sin cobertura será menor. A mayor posibilidades de obtener empleo, mayores serán las posibilidades de acceder a una cobertura de salud.
