# Preguntas a responder despues de haber realizado la entrega del ejercicio 1:


**Los tests 01, 02 y 03 demuestran la funcionalidad de cómo se incrementa la cantidad de huevos de avispas a medida que los van dejando. Cuando los implementaste, ¿esos tests pasaron (los tres) de una? ¿podrías haber implementado esta funcionalidad de a partes, haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03? ¿se te ocurre cómo? Y si lograste hacerlo, ¿qué pensas de implementar esa funcionalidad de esa forma?**

  Nosotros implementamos cada test gradualmente, ya que a diferencia del 2 y el 3, el 1 no tenia el mensaje de *Intentar Reproducirse*. No habria manera de a priori haber pasado el test 2 dado que no contabamos con la implementacion de dicho mensaje. Igualmente, al llevar a cabo el test 2, pudimos pasar el test 3 sin tener que implementar mensajes adicionales. Nos parece que es mas ordenado pensar la realizacion de los tests de manera gradual, dado que se puede verificar de manera rapida y consistente si hay algun error en la implementacion.  
  
 

**¿les quedó código repetido? ¿dónde? ¿Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)? Responsabilidad de dejar un huevo consumiendo otro insecto ¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes polillas u orugas y entonces dejar un huevo? ¿el insecto (Polly, Oriana, etc) o el hábitat? ¿por qué? ¿por qué tendría sentido que fuera de la otra forma? ¿con cuál nos quedamos?**

  Pudimos notar que nos quedo codigo repetido mirando las diferencias de la comida de La Avispa Polly y La Avispa Oriana, por lo que decidimos tener a La Avispa Polly de hija de La Avispa Oriana para reducir el codigo repetido entre ellas. Esto ayudo para que podamos darnos cuenta que las dos avispas se comportan de manera muy similar, por lo que no hace falta tener mas mensajes relacionados entre ellas.  En nuestro modelo el responsable de ver si hay suficientes polillas y orugas seria la Avispa, ya que a el habitat no le importa si hay suficientes orugas o polillas para que la avispa se pueda reproducir, solamente le importa a dicha avispa.
  
