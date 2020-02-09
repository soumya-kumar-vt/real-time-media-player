#! /bin/bash


for num_instances in {1..20}
do
	for run in {1..5}
	do
		if [ -f test.log ]
		then
			rm test.log
		fi
		for i in $(seq $num_instances)
		do
			{ mplayer test_60.mp4 >> test.log; } &
		done
		wait
		grep "Dropped Frames/Total Frames:" test.log > test_$num_instances\_$run.log
	done
done
