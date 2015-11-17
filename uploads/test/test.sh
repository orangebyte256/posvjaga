#!/bin/bash
cd $2
gcc "$1_source.c" -o $1 2> /dev/null
if [ ! $? -eq 0 ]; then
    echo "compile error"
    exit
fi
for i in {0..4}
do
	name="test_$i.txt"
	answer="answer_$i.txt"
	temp="$1_temp.txt"
	cp $1 /var/lib/lxc/my-container/rootfs/home/ubuntu/test/
	echo "" > $temp;
	timeout 1 lxc-attach -n my-container -- /home/ubuntu/test/$1 < $name > $temp;
	if ! [ -s $temp ]
	then
		echo "time limit on $i test"
		exit
	else
		if (! cmp $temp $answer > /dev/null) then
			echo "validation error on $i test"
			exit
		fi
	fi
done
echo "success"