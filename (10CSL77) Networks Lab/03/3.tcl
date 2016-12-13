if {$argc!=1} {
	error "Invalid no. of arguments! Need:1(interval) Got:$argc"
	exit 1
}

set ns [new Simulator]

set tr [open 3.tr w]
$ns trace-all $tr

set nf [open 3.nam w]
$ns namtrace-all $nf

proc finish {} {
	global ns tr nf

	close $tr
	close $nf

	exit 0
}

$ns color 1 "Red"
$ns color 2 "Blue"
$ns color 3 "Green"
$ns color 4 "Yellow"

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

$ns duplex-link $n0 $n2 2Mb 10ms DropTail
$ns duplex-link $n1 $n2 2Mb 10ms DropTail
$ns duplex-link $n2 $n3 2.5Mb 20ms DropTail
$ns duplex-link $n4 $n3 2Mb 10ms DropTail
$ns duplex-link $n5 $n3 2Mb 10ms DropTail

$ns duplex-link-op $n0 $n2 orient right-down
$ns duplex-link-op $n1 $n2 orient right-up
$ns duplex-link-op $n2 $n3 orient right
$ns duplex-link-op $n3 $n4 orient right-up
$ns duplex-link-op $n3 $n5 orient right-down

set ping0 [new Agent/Ping]
set ping1 [new Agent/Ping]
set ping4 [new Agent/Ping]
set ping5 [new Agent/Ping]

$ns attach-agent $n0 $ping0
$ns attach-agent $n1 $ping1
$ns attach-agent $n4 $ping4
$ns attach-agent $n5 $ping5

$ns connect $ping0 $ping5
$ns connect $ping5 $ping1
$ns connect $ping1 $ping4
$ns connect $ping4 $ping0

$ping0 set class_ 1
$ping1 set class_ 2
$ping4 set class_ 3
$ping5 set class_ 4

proc sendping {} {
	global ns argv ping0 ping1 ping4 ping5

	set interval [lindex $argv 0]
	set now [$ns now]

	#Ping again after interval and call this function again
	$ns at [expr $now+$interval] "$ping0 send"
	$ns at [expr $now+$interval] "$ping1 send"
	$ns at [expr $now+$interval] "$ping4 send"
	$ns at [expr $now+$interval] "$ping5 send"
	$ns at [expr $now+$interval] "sendping"
}

Agent/Ping instproc recv {from rtt} {}

$ns at 0 "sendping"
$ns rtmodel-at 2 down $n2 $n3
$ns rtmodel-at 3 up $n2 $n3
$ns at 5 "finish"

$ns run