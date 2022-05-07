# Preguntas teóricas
## Aporte de los mensajes de DD
**En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?**
  En el primer llamado se sabe a que subclase(Fraccion o Entero) se esta invocando, y en el segundo llamado, se esta viendo un mensaje de esta subclase. **PREGUNTAR**
## Lógica de instanciado
**Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?**
El mejor lugar para tener la logica de como instanciar un objeto es en el apartado de class dentro de cada subclase, ya que aca estariamos asignandole caracteristicas para diferenciar ese objeto dentro de dichas subclases.

## Nombres de las categorías de métodos
**Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?**
Se pueden categorizar metodos usando la comparacion de ellos, por ejemplo, en el primer ejercicio se podia categorizar los metodos segun su funcion en el habitad. Por otro lado, se puede categorizar segun la visibilidad hacia el usuario, poniendo private como nombre estariamos haciendo de este metodo algo oculto.

## Subclass Responsibility
**Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?**
Se pone el mensaje de self subclassresponsibility para poder entregarle el poder a cada subclase y que cada una de ellas responda de manera diferente a ese mismo mensaje

## No rompas
**¿Por qué está mal/qué problemas trae romper encapsulamiento?**
  Al romper el encapsulamiento, perdemos el orden por donde proviene el mensaje de la llamada anterior. Se pierde la forma y el uso que se le dio al programa, incentivando a que se cometan errores imprevistos que se podrian evitar simplemente siguiendo la linea de llamados que se tendria que hacer.


