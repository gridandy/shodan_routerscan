#!/bin/bash
#shodan init 
#echo "Пошук........" 
echo "Пошук по параметрах \"$1\""
shodan search --limit 1000 $1 | awk {'print $1'} | awk '!seen[$0]++' > ranges.txt
shodan search --limit 1000 $1 | awk {'print $2'} | awk '!seen[$0]++' > ports.txt
wc -w ranges.txt | awk {'print "Знайдено -- "$1" -- IP адрес"'}
CIP=$( wc -w ranges.txt | awk {'print $1'} )
#echo $CIP
if [ $CIP -gt 0 ]
then
	echo "Запуск  RS....."
	wine RouterScan.exe
else
	echo "Вихiд"
fi
