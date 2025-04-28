module Lib () where

import Text.Show.Functions ()

doble :: Int -> Int
doble x = x * 2

-- Siempre que laburamos con algun codigo lo tenemos que hacer en src (Aca podemos crear nuevas carpetas y demas)

-- Por el momento solo tendremos los personajes Espina y Pamela, de estos nos interesa su nombre;
-- su poder básico;
-- su súper poder;
-- si tiene el súper poder activo y
-- su cantidad de vida.

-- bolaEspinosa: le quita 1000 puntos de vida a quien sea su contrincante (¡no debe quedar un numero negativo!)
-- lluviaDeTuercas: pueden ser sanadoras o dañinas. Las primeras le suman 800 puntos de vida a su colega y las segundas le disminuyen
-- a la mitad la vida de quien sea su contrincante. En cualquier otro caso, no le pasa nada al personaje
-- granadaDeEspinas: el daño va a depender del radio de explosion de la misma. Si es mayor a 3, le agregara su nombre "Espina 
-- estuvo aqui". Si ademas su contrincante tiene menos 800 vida, desactiva su super y lo deja con 0 de vida. En otro caso, se usa
-- una bola de espinas
-- torretaCurativa: le activa el super a su aliado y lo deja con el doble de su salud inicial

-- Se quiere reportar atacar con el poder especial: Si el personaje tiene el super poder activo, entonces va a atacar a su
-- contrincante con el super y con el basico. Si no, no ara nada.
-- saber quienes estan en las ultimas: es decir, el nombre de aquellos brawlers que tienen menor de 800 puntos de vida

-- 1) Modelar los poderes

data Personajes = Personajes {
    nombrePersonaje :: String,
    poderBasico :: Poder,
    superPoder :: Poder,
    cantidadDeVida :: Int
} deriving (Show, Eq)

-- Basicamente un "poder" no es un data que guarda specs para evaluar y cambiar, es solamente una funcion que va de Personaje a Personaje porque le entra un Personaje y en fin
-- todo a lo que se reduce un poder es a afectar el campo CantidadDeVida 
type Poder = Personaje -> Personaje 

-- Buscar funcion max en Haskell 
bolaEspinosa :: Poder 
bolaEspinosa personajeAfectado = personajeAfectado {cantidadDeVida = cantidadDeVida - 1000 max }

lluviaDeTuercas :: Poder 
