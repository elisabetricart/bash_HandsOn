##exercise1
cd bash_HandsOn ##ens situem al  directori
mkdir exercici ##creamos directorio
cd exercici
nano exercise1.sh

wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/exercises/bash/TAIR9_mRNA.bed #desacrgamos

head TAIR9_mRNA.bed #mirar que hi ha al fitxer

wc -l <(grep chr1<(grep + TAIR9_mRNA.bed)) ##selecionar los del chr1 i + 
uniq <(sort -nr <(awk '{print$NF}' <(sed 's/,/ /g' <(head -n 10 <(awk '{print$11}' TAIR9_mRNA.bed )))))##mirar las 10 primeras llistes d'exons, treure les comes per espais i ordenar de mes gran a més petits els valors
grep chr1 TAIR9_mRNA.bed | awk '{print$11}' | tr , "\n" | sort -nr | head ## mostrar els mes llargs
awk '{print$4"\t"$10}'TAIR9_mRNA.bed |sort -nr -k2,2 |uniq |head ##obtenir els noms del exons ordenats i eliminan els repatits

