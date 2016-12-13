if {$argc!=1} {
	error "Invalid no. of arguments! Need:1(bandwidth) Got:$argc"
	exit 1
}

set ns [new Simulator]

set tr [open 2.tr w]
$ns trace-all $tr

set nf [open 2.nam w]
$ns namtrace-all $nf

proc finish {} {
	global ns tr nf

	$ns flush-trace
	close $tr
	close $nf

	exit 0
}

#Declare class colors
$ns color 1 "Red"
$ns color 2 "Green"

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns duplex-link $n0 $n2 2Mb 10ms DropTail
$ns duplex-link $n1 $n2 2Mb 10ms DropTail
$ns duplex-link $n2 $n3 [lindex $argv 0]Mb 10ms DropTail

$ns queue-limit $n2 $n3 10

$ns duplex-link-op $n0 $n2 orient right-down
$ns duplex-link-op $n1 $n2 orient right-up
$ns duplex-link-op $n2 $n3 orient right

set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp
set ftp [new Application/FTP]
$ftp attach-agent $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n3 $sink
$ns connect $tcp $sink

#Set color of packets (classes)
$tcp set class_ 1

set udp [new Agent/UDP]
$ns attach-agent $n1 $udp
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
set null [new Agent/Null]
$ns attach-agent $n3 $null
$ns connect $udp $null

$udp set class_ 2
#Additional properties
$cbr set packetsize_ 500
$cbr set interval_ 0.0025

$ns at 0 "$ftp start"
$ns at 0 "$cbr start"
$ns at 10 "finish"

$ns run