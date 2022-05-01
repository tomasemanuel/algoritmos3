# Preguntas a responder despues de haber realizado la entrega del ejercicio 2:

## Abstracción de los tests 01 y 02
**En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?**

Nosotros, al ver que en los dos codigos se repetía la misma idea de ejecutar un bloque de código en un determinado tiempo, decidimos abstraer esa idea (entidad de la realidad) e implementarla de manera general a través de un método.

## Cómo representar en Smalltalk
**¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?**

Se pueden usar Objetos que responder a ciertos mensajes simulando estar en la realidad, ademas de poder tener colaboraciones entre dichos Objetos representando y aumentando el dominio de dicha realidad.

## Teoría de Naur
**¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?**

La relacion que hay entre sacar codigo repetido y la teoria del modelo se basa en confrontar la solucion actual conteniendo codigo repetido y las demandas de la modificacion deseada. En otras palabras, el principal enfoque sería abstraer ideas y similitudes de la solucion actual y simplificarla. En esta confrontación se
determinará el tipo y nivel de similitud entre las nuevas demandas y las capacidades
de la solución actual.
