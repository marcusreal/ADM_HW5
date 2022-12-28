echo "What is the most popular pair of heroes (often appearing together in the comics)?"
awk -F"|" '{ if($1!=$2){ arr[$1,$2]++;}}END{for( a in arr) print a":"arr[a];}' hero-network.csv > output.csv
sort --field-separator=":"  -k2 -n -r   output.csv | head -1
echo "Number of comics per hero, all heroes are in n_comics_hero.csv,are  show only the  first 10 heroes"
awk -F"," '{arr[$1]++;}END{for(a in arr) print a":"arr[a];}' edges.csv | sort --field-separator=':' -k2 -n -r >  n_comics_hero.csv
cat n_comics_hero.csv | head -10
echo "The average number of heroes in comics"
awk -F"," '{arr[$2]++}END{ sum=0;  for( a in arr){ sum += arr[a];} avg =  sum/length(arr); print avg;}' edges.csv > output.txt 
cat output.txt
