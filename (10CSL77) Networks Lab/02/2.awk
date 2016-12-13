#!/usr/bin/awk
BEGIN{
	tcpsend=0
	udpsend=0
	tcpdrop=0
	udpdrop=0
	tcpdr=0.0
	udpdr=0.0
}

{
	if($1=="+"){
		if($3=="0" && $4=="2")	++tcpsend
		if($3=="1" && $4=="2")	++udpsend
	}
	if($1=="d"){
		if($8=="1")	++tcpdrop
		else		++udpdrop
	}
}

END{
	tcpdr=tcpdrop/tcpsend
	udpdr=udpdrop/udpsend
	printf("%f %f %f %f\n",1.0-tcpdr,1.0-udpdr,tcpdr,udpdr)
}
