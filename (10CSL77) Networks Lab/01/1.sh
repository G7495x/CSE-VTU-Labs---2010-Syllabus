#!/bin/bash
echo 'TitleText: "Bandwidth vs Packets Dropped"'>1.xg
echo 'XUnitText: "Bandwidth"'>>1.xg
echo 'YUnitText: "Packets Dropped"'>>1.xg
echo ''>>1.xg

for i in {1..10}
do
	a=$(echo "$i*0.2"|bc -l)
	ns 1.tcl $a
	echo $a $(awk -f 1.awk 1.tr)>>1.xg
done

xgraph -lw 2 -bg white 1.xg &
nam 1
