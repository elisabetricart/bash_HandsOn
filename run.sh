  
 task 1
mkdir bash_HandsOn #creamos el directorio donde trabajaremos
cd bash_HandsOn #nos situamos en el
mkdir bin # creamos diferentes directodios dentro del bash_HandsOn
mkdir input
mkdir output
mkdir logs
mkdir trash
ls -l #miramos que esten bien los diferentes directorios
mkdir trash2
cp -r trash trash2 #copiamos trash en trash2
mv trash trash1  #movemos trash en trash1
rm -rf trash2 #remove  a trash2

#task2
wget https://raw.githubusercontent.com/dgarrimar/teaching/master/uvic/AdvBI_2018/data/hands-on/bash/sample-groups.tsv #descargamos
mv sample-groups.tsv input/ input.tsv #movemos el sample-groups a dentro de input i lo llamamos input.tsv
ln -s ../ input trash1 #miramos en trash1		
cd trash1 #nos situamos en trash1
mv input.tsv imput_symlink #movemos el input a simput_symlink
cd input #nos situamos en input
cp input/input.tsv transh1/input_copy # hacemos una copia del input,tsv al trash1 y lo nombramos input_copy
cd trash1  #nos situamos en trash1
mv input.tsv input_copy
touch IAmLearningSomeBash #creamos un  archivo i lo llamamos IAmLearningSomeBash
rm -rf transh1 #remove trash1

#task 3

cd bash_HandsOn
mkdir  task_3
mv task_3 output #movemos trask_3 en ouput
cd task_3
touch top100.tsv 
touch top50.tsv
cd ../..
cat input/input.tsv tail -n50 >ouput/task_3/last50.tsv #imprime las 50 primeras lineas
cat input/input.tsv head -n100 > output/task_3/top100.tsv #imprime las 100 primeras lineas
wc output/task_3/top100.tsv
wc output/task:3/last50.tsv
cd output/task_3
cat top100.tsv last50.tsv >150together.tsv #concatenar 

#task 4
cd bash_HandsOn/output/task_4
cut -f2 input/input.tsv| sort -r|grep -v "Adipose\|Artery"|uniq >output/task_4/unique.tissues2.txt #obtenemos la columna 2 del artery i el adipose
less output/task_4/unique.tissues2.txt
cut -f3 input/input.tsv| sort -r| grep -v "Adipose\|Artery"|uniq > output/task_4/unique.tissues3.txt
less output/task_4/unique.tissues3.txt
cd output/task_4
diff unique.tissues2.txt unique.tissues3.txt > differences #vemos las diferencias

#task 5
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/scripts.tar.gz
cd bash_HandsOn
gunzip scripts.tar.gz #descomprimimos el  file
tar -xf scripts.tar
mv usage.sh bin/ #lo movemos a bin

cat bin/usage.sh  #modificamos el file
echo "the script $0 has received the argument $1 > bin /usage.sh
cat bin/usage.sh
PATH = "$PATH:/home/bash_HandsOn/bin" #añadimos el bin folder
chmod +x bin/usage.sh #damos permiso
./usage.sh #ejecutamos

#task 6
cd bash_HandsOn
cd bin
wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/hands-on/bash/unknown.samples.tsv
##join  the two files
join -t $'\t' <(sort -k1,1 input/input.tsv) <(sort -k1,1 bin/unknown.sample.tsv) >output/join.tsv
##imprimir les columnas de forma reversa
awk '{print$4,$3,$2,$1}' output/joint.tsv |sed 's/_/ /g' > joint.tsv
rm output/joint.tsv #remove

#task7

if ["$1" !=" "]; then
	counter=0
	while [$counter -lt 5]; do
		echo "the script  $0 has received the argument $1"
		let counter =counter +1
	done
else
	echo "no argument provided"
fi 
