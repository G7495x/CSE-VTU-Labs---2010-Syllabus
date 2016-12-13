if {$argc!=1} {
	error "Invalid no. of arguments! Need:1(bandwidth) Got:$argc"
	exit 1
}

#Create new Simulator
set ns [new Simulator]

#Create trace-file and set trace function
set tr [open 1.tr w]
$ns trace-all $tr

#Create network-animator trace-file and set trace function
set nf [open 1.nam w]
$ns namtrace-all $nf

#End procedure
proc finish {} {
	#Declare global variables utilized inside the function
	global ns tr nf

	#Flush the traces and close the files
	$ns flush-trace
	close $tr
	close $nf

	exit 0
}

#Create nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]

#Create links
$ns duplex-link $n0 $n1 2Mb 10ms DropTail
$ns duplex-link $n1 $n2 [lindex $argv 0]Mb 10ms DropTail

$ns queue-limit $n1 $n2 10

#Orient links
$ns duplex-link-op $n0 $n1 orient right
$ns duplex-link-op $n1 $n2 orient right

#Create Agent and attach to node
set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp
#Create Application and attach to Agent
set ftp [new Application/FTP]
$ftp attach-agent $tcp
#Create destination and attach to node
set sink [new Agent/TCPSink]
$ns attach-agent $n2 $sink
#Connect source and destination Agents
$ns connect $tcp $sink

#Set the timestamps at which events, procedure calls, etc. occur
$ns at 0 "$ftp start"
$ns at 10 "finish"

#Run Simulation
$ns run