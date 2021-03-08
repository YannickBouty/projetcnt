#!/bin/bash
#Début tests
echo '------------------------------------------------------------------------'
echo 'DEBUT TESTS'
echo '------------------------------------------------------------------------'
echo 'TESTS UPLOAD'
echo '------------------------------------------------------------------------'
#Test : user ok, fichier existant et extension ok
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.csv'
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.gif'
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.jpeg'
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.jpg'
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.md'
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.pdf'
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.png'
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.txt'
echo '------------------------------------------------------------------------'
#Test : user ok, fichier existant et extension ok en majuscule
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.CSV'
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.GIF'
echo '------------------------------------------------------------------------'
#Test : user ok, fichier > 5Mo et extension ok
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/bigdata.pdf'
echo '------------------------------------------------------------------------'
#Test : user ko, fichier existant et extension ok
curl -i -X POST -u "user:pwd" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.txt'
echo '------------------------------------------------------------------------'
#Test : user ok, fichier existant et extension ko
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.sql'
echo '------------------------------------------------------------------------'
#Test : user ok, fichier non existant et extension quelconque
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@./fichierstest/data.doc'
echo '------------------------------------------------------------------------'
#Test : user ok, fichier non écrit dans la requête et extension quelconque
curl -i -X POST -u "francoislaissus:mssio" http://ec2-54-146-31-245.compute-1.amazonaws.com/uploadfile -F 'monFichier=@'
echo '------------------------------------------------------------------------'
echo 'FIN TESTS'
echo '------------------------------------------------------------------------'

