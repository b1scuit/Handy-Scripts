EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CPU:Z80CPU U1
U 1 1 5F0C1C0C
P 5750 3900
F 0 "U1" H 5250 5450 50  0000 C CNN
F 1 "Z80CPU" H 5350 5350 50  0000 C CNN
F 2 "" H 5750 4300 50  0001 C CNN
F 3 "www.zilog.com/manage_directlink.php?filepath=docs/z80/um0080" H 5750 4300 50  0001 C CNN
	1    5750 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x16 J1
U 1 1 5F0C433B
P 6650 3400
F 0 "J1" H 6730 3392 50  0000 L CNN
F 1 "Conn_01x16" H 6730 3301 50  0000 L CNN
F 2 "" H 6650 3400 50  0001 C CNN
F 3 "~" H 6650 3400 50  0001 C CNN
	1    6650 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J2
U 1 1 5F0C521D
P 6650 4700
F 0 "J2" H 6730 4692 50  0000 L CNN
F 1 "Conn_01x08" H 6730 4601 50  0000 L CNN
F 2 "" H 6650 4700 50  0001 C CNN
F 3 "~" H 6650 4700 50  0001 C CNN
	1    6650 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4700 4600 4700
Wire Wire Line
	4600 4700 4600 5700
Wire Wire Line
	5050 4600 4450 4600
Wire Wire Line
	4450 4600 4450 5800
Wire Wire Line
	5050 4500 4350 4500
Wire Wire Line
	4350 4500 4350 5900
Wire Wire Line
	5050 4400 4250 4400
Wire Wire Line
	4250 4400 4250 6000
Wire Wire Line
	5050 3700 4150 3700
Wire Wire Line
	4150 3700 4150 6100
Wire Wire Line
	5050 3000 3950 3000
Wire Wire Line
	3950 3000 3950 6300
Wire Wire Line
	5050 2700 3850 2700
Wire Wire Line
	3850 2700 3850 6400
$Comp
L power:GNDREF #PWR?
U 1 1 5F0C8EC8
P 5750 5400
F 0 "#PWR?" H 5750 5150 50  0001 C CNN
F 1 "GNDREF" H 5755 5227 50  0000 C CNN
F 2 "" H 5750 5400 50  0001 C CNN
F 3 "" H 5750 5400 50  0001 C CNN
	1    5750 5400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 5F0C9845
P 8200 3350
F 0 "J4" H 8280 3392 50  0000 L CNN
F 1 "Conn_01x01" H 8280 3301 50  0000 L CNN
F 2 "" H 8200 3350 50  0001 C CNN
F 3 "~" H 8200 3350 50  0001 C CNN
	1    8200 3350
	1    0    0    -1  
$EndComp
Text GLabel 5050 4000 0    50   Input ~ 0
HALT
Text GLabel 8000 3350 0    50   Input ~ 0
HALT
$Comp
L power:GNDREF #PWR?
U 1 1 5F0CC508
P 7500 4900
F 0 "#PWR?" H 7500 4650 50  0001 C CNN
F 1 "GNDREF" H 7505 4727 50  0000 C CNN
F 2 "" H 7500 4900 50  0001 C CNN
F 3 "" H 7500 4900 50  0001 C CNN
	1    7500 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C1
U 1 1 5F0CD2F4
P 7500 4750
F 0 "C1" H 7615 4796 50  0000 L CNN
F 1 "100uF" H 7615 4705 50  0000 L CNN
F 2 "" H 7500 4750 50  0001 C CNN
F 3 "~" H 7500 4750 50  0001 C CNN
	1    7500 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0CE803
P 7500 4600
F 0 "#PWR?" H 7500 4450 50  0001 C CNN
F 1 "+5V" H 7515 4773 50  0000 C CNN
F 2 "" H 7500 4600 50  0001 C CNN
F 3 "" H 7500 4600 50  0001 C CNN
	1    7500 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5F0D4D60
P 8000 4900
F 0 "#PWR?" H 8000 4650 50  0001 C CNN
F 1 "GNDREF" H 8005 4727 50  0000 C CNN
F 2 "" H 8000 4900 50  0001 C CNN
F 3 "" H 8000 4900 50  0001 C CNN
	1    8000 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C2
U 1 1 5F0D4D66
P 8000 4750
F 0 "C2" H 8115 4796 50  0000 L CNN
F 1 "100uF" H 8115 4705 50  0000 L CNN
F 2 "" H 8000 4750 50  0001 C CNN
F 3 "~" H 8000 4750 50  0001 C CNN
	1    8000 4750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0D4D6C
P 8000 4600
F 0 "#PWR?" H 8000 4450 50  0001 C CNN
F 1 "+5V" H 8015 4773 50  0000 C CNN
F 2 "" H 8000 4600 50  0001 C CNN
F 3 "" H 8000 4600 50  0001 C CNN
	1    8000 4600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0D53B9
P 5750 2400
F 0 "#PWR?" H 5750 2250 50  0001 C CNN
F 1 "+5V" H 5750 2550 50  0000 C CNN
F 2 "" H 5750 2400 50  0001 C CNN
F 3 "" H 5750 2400 50  0001 C CNN
	1    5750 2400
	1    0    0    -1  
$EndComp
Text GLabel 5050 3900 0    50   Input ~ 0
WAIT
Text GLabel 5050 3300 0    50   Input ~ 0
NMI
$Comp
L power:+5V #PWR?
U 1 1 5F0D74D5
P 8100 2550
F 0 "#PWR?" H 8100 2400 50  0001 C CNN
F 1 "+5V" H 8115 2723 50  0000 C CNN
F 2 "" H 8100 2550 50  0001 C CNN
F 3 "" H 8100 2550 50  0001 C CNN
	1    8100 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5F0D7E8E
P 8100 2700
F 0 "R1" H 8170 2746 50  0000 L CNN
F 1 "1K" H 8170 2655 50  0000 L CNN
F 2 "" V 8030 2700 50  0001 C CNN
F 3 "~" H 8100 2700 50  0001 C CNN
	1    8100 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F0DD590
P 8400 2700
F 0 "R2" H 8470 2746 50  0000 L CNN
F 1 "1K" H 8470 2655 50  0000 L CNN
F 2 "" V 8330 2700 50  0001 C CNN
F 3 "~" H 8400 2700 50  0001 C CNN
	1    8400 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5F0E0AF0
P 8700 2700
F 0 "R3" H 8770 2746 50  0000 L CNN
F 1 "1K" H 8770 2655 50  0000 L CNN
F 2 "" V 8630 2700 50  0001 C CNN
F 3 "~" H 8700 2700 50  0001 C CNN
	1    8700 2700
	1    0    0    -1  
$EndComp
Text GLabel 5050 5000 0    50   Input ~ 0
BUSREQ
Text GLabel 5050 5100 0    50   Input ~ 0
BUSACK
Wire Wire Line
	5050 3400 4050 3400
Wire Wire Line
	4050 3400 4050 6200
Text GLabel 8000 2850 0    50   Input ~ 0
BUSREQ
Text GLabel 8000 3000 0    50   Input ~ 0
BUSACK
Text GLabel 8000 3150 0    50   Input ~ 0
WAIT
Wire Wire Line
	8000 2850 8100 2850
Wire Wire Line
	8000 3000 8400 3000
Wire Wire Line
	8000 3150 8700 3150
Wire Wire Line
	8100 2550 8400 2550
Connection ~ 8100 2550
Wire Wire Line
	8400 2550 8700 2550
Connection ~ 8400 2550
Wire Wire Line
	8400 2850 8400 3000
Wire Wire Line
	8700 2850 8700 3150
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 5F0F7083
P 8200 3550
F 0 "J5" H 8280 3592 50  0000 L CNN
F 1 "Conn_01x01" H 8280 3501 50  0000 L CNN
F 2 "" H 8200 3550 50  0001 C CNN
F 3 "~" H 8200 3550 50  0001 C CNN
	1    8200 3550
	1    0    0    -1  
$EndComp
Text GLabel 8000 3550 0    50   Input ~ 0
NMI
$Comp
L Connector_Generic:Conn_01x08 J3
U 1 1 5F0C5AA5
P 4800 6100
F 0 "J3" H 4880 6092 50  0000 L CNN
F 1 "Conn_01x08" H 4880 6001 50  0000 L CNN
F 2 "" H 4800 6100 50  0001 C CNN
F 3 "~" H 4800 6100 50  0001 C CNN
	1    4800 6100
	1    0    0    1   
$EndComp
Wire Wire Line
	4450 5800 4600 5800
Wire Wire Line
	4600 5900 4350 5900
Wire Wire Line
	4250 6000 4600 6000
Wire Wire Line
	4600 6100 4150 6100
Wire Wire Line
	4050 6200 4600 6200
Wire Wire Line
	4600 6300 3950 6300
Wire Wire Line
	3850 6400 4600 6400
$EndSCHEMATC
