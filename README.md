# Memorin---Haskell

-Juego del Ahorcado en Haskell

Juego de Ahorcado para dos jugadores, desarrollado en Haskell, que se ejecuta por consola.
Cada jugador ingresa una palabra secreta y el oponente debe adivinarla con un número limitado de intentos.

-Características:

-Juego 1 vs 1 con turnos alternados
-Palabras ingresadas de forma oculta (no visibles en pantalla)
-Posibilidad de:
  -Adivinar letras
  -Arriesgar la palabra completa
-Control de intentos por jugador
-Visualización del progreso de la palabra (- para letras no acertadas)
-Implementado sin estado mutable, usando recursión y funciones puras

-Tecnologías utilizadas
Haskell
Manejo de IO
Recursividad
Programación funcional

Cómo ejecutar el proyecto:
1) ghc --version
2) git clone https://github.com/tu-usuario/ahorcado-haskell.git
3) cd ahorcado-haskell
4) ghc main.hs
5) ./main

-Cómo jugar
1) Ingresá el nombre de ambos jugadores.
2) Cada jugador escribe una palabra secreta (se muestra con guiones).
3) Los jugadores se turnan para:
  Ingresar una letra, o
  Arriesgar la palabra completa.
4) Cada jugador tiene 5 intentos.
5) Gana quien adivina la palabra antes de quedarse sin intentos.
