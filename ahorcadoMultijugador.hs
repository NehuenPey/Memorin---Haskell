import System.IO

ahorcado = do putStrLn "Ingrese el nombre del jugador 1"
              name1 <- getLine
              putStrLn "Ingrese el nombre del jugador 2"
              name2 <- getLine
              putStrLn ("Piense una Palabra para "++ name2)
              palabra2 <- sgetLine
              putStrLn ("Piense una Palabra para "++ name1)
              palabra1 <- sgetLine
              putStrLn "Intente Adivinar"
              adivinar 5 palabra1 "" name1 True 5 palabra2 "" name2 True

sgetLine = do hSetEcho stdin False
              palabra <- sgetLine'
              hSetEcho stdin True
              return palabra

sgetLine' = do x <- getChar
               if x == '\n' then do putChar x
                                    return []
                            else do putChar '-'
                                    xs <- sgetLine'
                                    return (x:xs)



adivinar intentos1 palabra1 aciertos1 name1 juega1 intentos2 palabra2 aciertos2 name2 juega2 =
                                    do if (juega1==False && juega2 == False) then putStr ("Juego Terminado")
                                       else if juega1 == False then adivinar intentos2 palabra2 aciertos2 name2 juega2 intentos1 palabra1 aciertos1 name1 juega1
                                            else do putStr ("Intento "++show(intentos1)++" de "++name1++" > ")
                                                    xs <- getLine
                                                    if (length xs) > 1 then do arriesgar xs palabra1
                                                                               adivinar intentos2 palabra2 aciertos2 name2 juega2 intentos1 palabra1 aciertos1 name1 False
                                                    else if (elem (head xs) palabra1) then do putStrLn (diff palabra1 (aciertos1++xs))
                                                                                              if ((diff palabra1 (aciertos1++xs)) == palabra1) then do putStr "Esa es la palabra. Ganaste!"
                                                                                                                                                       adivinar intentos2 palabra2 aciertos2 name2 juega2 intentos1 palabra1 aciertos1 name1 False
                                                                                              else adivinar intentos2 palabra2 aciertos2 name2 juega2 intentos1 palabra1 (aciertos1++xs) name1 juega1
                                                         else if intentos1 == 0 then do putStrLn "Maximo de intenots! Perdiste!"
                                                                                        adivinar intentos2 palabra2 aciertos2 name2 juega2 intentos1 palabra1 aciertos1 name1 False
                                                              else adivinar intentos2 palabra2 aciertos2 name2 juega2 (intentos1-1) palabra1 aciertos1 name1 juega1

diff xs ys = [if elem x ys then x else '-' | x <- xs]
arriesgar cadena palabra | cadena == palabra = putStr "Esa es la palabra. Ganaste! \n"
                         | otherwise = putStr "Perdiste \n"
main = ahorcado
