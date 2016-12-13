#!/bin/bash
echo 'TitleText: "Bandwidth vs. Arrival ratio"'>21.xg
echo 'XUnitText: "Bandwidth"'>>21.xg
echo 'YUnitText: "Arrival ratio"'>>21.xg
echo ''>>21.xg

echo 'TitleText: "Bandwidth vs. Drop ratio"'>22.xg
echo 'XUnitText: "Bandwidth"'>>22.xg
echo 'YUnitText: "Drop ratio"'>>22.xg
echo ''>>22.xg

tcpa=""	#TCP arrival ratios
udpa=""	#UDP arrival ratios
tcpd=""	#TCP drop ratios
udpd=""	#UDP drop ratios
for i in {1..20}
do
	a=$(echo "$i*0.2"|bc -l)
	ns 2.tcl $a
	output=$(awk -f 2.awk 2.tr)	#Output of awk has 4 columns:
								#1. TCP arrival ratio
								#2. UDP arrival ratio
								#3. TCP drop ratio
								#4. UDP drop ratio
	tcpa="$tcpa$(echo $'\n' $a $(echo $output|awk '{print $1}'))"	#Append new values
	udpa="$udpa$(echo $'\n' $a $(echo $output|awk '{print $2}'))"	#Append new values
	tcpd="$tcpd$(echo $'\n' $a $(echo $output|awk '{print $3}'))"	#Append new values
	udpd="$udpd$(echo $'\n' $a $(echo $output|awk '{print $4}'))"	#Append new values
done

echo '"TCP"'>>21.xg
echo "$tcpa">>21.xg
echo $'\n''"UDP"'>>21.xg
echo "$udpa">>21.xg
echo '"TCP"'>>22.xg
echo "$tcpd">>22.xg
echo $'\n''"UDP"'>>22.xg
echo "$udpd">>22.xg

xgraph -lw 2 -bg white 21.xg &
xgraph -lw 2 -bg white 22.xg &
nam 2