EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	3550 5400 6050 5400
Wire Wire Line
	3450 5500 6050 5500
Text GLabel 7600 2650 0    50   Input ~ 0
NMI
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 5F0F7083
P 7800 2650
F 0 "J5" H 7880 2692 50  0000 L CNN
F 1 "Conn_01x01" H 7880 2601 50  0000 L CNN
F 2 "" H 7800 2650 50  0001 C CNN
F 3 "~" H 7800 2650 50  0001 C CNN
	1    7800 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 1950 8300 2250
Wire Wire Line
	8000 1950 8000 2100
Connection ~ 8000 1650
Wire Wire Line
	8000 1650 8300 1650
Connection ~ 7700 1650
Wire Wire Line
	7700 1650 8000 1650
Wire Wire Line
	7600 2250 8300 2250
Wire Wire Line
	7600 2100 8000 2100
Wire Wire Line
	7600 1950 7700 1950
Text GLabel 7600 2250 0    50   Input ~ 0
WAIT
Text GLabel 7600 2100 0    50   Input ~ 0
BUSACK
Text GLabel 7600 1950 0    50   Input ~ 0
BUSREQ
Wire Wire Line
	3650 2500 3650 5300
Wire Wire Line
	4650 2500 3650 2500
Wire Wire Line
	3650 5300 6050 5300
Text GLabel 4650 4200 0    50   Input ~ 0
BUSACK
Text GLabel 4650 4100 0    50   Input ~ 0
BUSREQ
$Comp
L Device:R R3
U 1 1 5F0E0AF0
P 8300 1800
F 0 "R3" H 8370 1846 50  0000 L CNN
F 1 "1K" H 8370 1755 50  0000 L CNN
F 2 "" V 8230 1800 50  0001 C CNN
F 3 "~" H 8300 1800 50  0001 C CNN
	1    8300 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F0DD590
P 8000 1800
F 0 "R2" H 8070 1846 50  0000 L CNN
F 1 "1K" H 8070 1755 50  0000 L CNN
F 2 "" V 7930 1800 50  0001 C CNN
F 3 "~" H 8000 1800 50  0001 C CNN
	1    8000 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5F0D7E8E
P 7700 1800
F 0 "R1" H 7770 1846 50  0000 L CNN
F 1 "1K" H 7770 1755 50  0000 L CNN
F 2 "" V 7630 1800 50  0001 C CNN
F 3 "~" H 7700 1800 50  0001 C CNN
	1    7700 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0D74D5
P 7700 1650
F 0 "#PWR?" H 7700 1500 50  0001 C CNN
F 1 "+5V" H 7715 1823 50  0000 C CNN
F 2 "" H 7700 1650 50  0001 C CNN
F 3 "" H 7700 1650 50  0001 C CNN
	1    7700 1650
	1    0    0    -1  
$EndComp
Text GLabel 4650 2400 0    50   Input ~ 0
NMI
Text GLabel 4650 3000 0    50   Input ~ 0
WAIT
$Comp
L power:+5V #PWR?
U 1 1 5F0D53B9
P 5350 1500
F 0 "#PWR?" H 5350 1350 50  0001 C CNN
F 1 "+5V" H 5350 1650 50  0000 C CNN
F 2 "" H 5350 1500 50  0001 C CNN
F 3 "" H 5350 1500 50  0001 C CNN
	1    5350 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0D4D6C
P 7600 3700
F 0 "#PWR?" H 7600 3550 50  0001 C CNN
F 1 "+5V" H 7615 3873 50  0000 C CNN
F 2 "" H 7600 3700 50  0001 C CNN
F 3 "" H 7600 3700 50  0001 C CNN
	1    7600 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C2
U 1 1 5F0D4D66
P 7600 3850
F 0 "C2" H 7715 3896 50  0000 L CNN
F 1 "100uF" H 7715 3805 50  0000 L CNN
F 2 "" H 7600 3850 50  0001 C CNN
F 3 "~" H 7600 3850 50  0001 C CNN
	1    7600 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5F0D4D60
P 7600 4000
F 0 "#PWR?" H 7600 3750 50  0001 C CNN
F 1 "GNDREF" H 7605 3827 50  0000 C CNN
F 2 "" H 7600 4000 50  0001 C CNN
F 3 "" H 7600 4000 50  0001 C CNN
	1    7600 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0CE803
P 7100 3700
F 0 "#PWR?" H 7100 3550 50  0001 C CNN
F 1 "+5V" H 7115 3873 50  0000 C CNN
F 2 "" H 7100 3700 50  0001 C CNN
F 3 "" H 7100 3700 50  0001 C CNN
	1    7100 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C1
U 1 1 5F0CD2F4
P 7100 3850
F 0 "C1" H 7215 3896 50  0000 L CNN
F 1 "100uF" H 7215 3805 50  0000 L CNN
F 2 "" H 7100 3850 50  0001 C CNN
F 3 "~" H 7100 3850 50  0001 C CNN
	1    7100 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5F0CC508
P 7100 4000
F 0 "#PWR?" H 7100 3750 50  0001 C CNN
F 1 "GNDREF" H 7105 3827 50  0000 C CNN
F 2 "" H 7100 4000 50  0001 C CNN
F 3 "" H 7100 4000 50  0001 C CNN
	1    7100 4000
	1    0    0    -1  
$EndComp
Text GLabel 7600 2450 0    50   Input ~ 0
HALT
Text GLabel 4650 3100 0    50   Input ~ 0
HALT
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 5F0C9845
P 7800 2450
F 0 "J4" H 7880 2492 50  0000 L CNN
F 1 "Conn_01x01" H 7880 2401 50  0000 L CNN
F 2 "" H 7800 2450 50  0001 C CNN
F 3 "~" H 7800 2450 50  0001 C CNN
	1    7800 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5F0C8EC8
P 5350 4500
F 0 "#PWR?" H 5350 4250 50  0001 C CNN
F 1 "GNDREF" H 5355 4327 50  0000 C CNN
F 2 "" H 5350 4500 50  0001 C CNN
F 3 "" H 5350 4500 50  0001 C CNN
	1    5350 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1800 3450 5500
Wire Wire Line
	4650 1800 3450 1800
Wire Wire Line
	3550 2100 3550 5400
Wire Wire Line
	4650 2100 3550 2100
Wire Wire Line
	3750 5200 6050 5200
Wire Wire Line
	3750 2800 3750 5200
Wire Wire Line
	4650 2800 3750 2800
Wire Wire Line
	3850 5100 6050 5100
Wire Wire Line
	3850 3500 3850 5100
Wire Wire Line
	4650 3500 3850 3500
Wire Wire Line
	3950 5000 6050 5000
Wire Wire Line
	3950 3600 3950 5000
Wire Wire Line
	4650 3600 3950 3600
Wire Wire Line
	4050 4900 6050 4900
Wire Wire Line
	4050 3700 4050 4900
Wire Wire Line
	4650 3700 4050 3700
Wire Wire Line
	4200 4800 6050 4800
Wire Wire Line
	4200 3800 4200 4800
Wire Wire Line
	4650 3800 4200 3800
$Comp
L Connector_Generic:Conn_01x08 J3
U 1 1 5F0C5AA5
P 6250 5100
F 0 "J3" H 6330 5092 50  0000 L CNN
F 1 "Conn_01x08" H 6330 5001 50  0000 L CNN
F 2 "" H 6250 5100 50  0001 C CNN
F 3 "~" H 6250 5100 50  0001 C CNN
	1    6250 5100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J2
U 1 1 5F0C521D
P 6250 3800
F 0 "J2" H 6330 3792 50  0000 L CNN
F 1 "Conn_01x08" H 6330 3701 50  0000 L CNN
F 2 "" H 6250 3800 50  0001 C CNN
F 3 "~" H 6250 3800 50  0001 C CNN
	1    6250 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x16 J1
U 1 1 5F0C433B
P 6250 2500
F 0 "J1" H 6330 2492 50  0000 L CNN
F 1 "Conn_01x16" H 6330 2401 50  0000 L CNN
F 2 "" H 6250 2500 50  0001 C CNN
F 3 "~" H 6250 2500 50  0001 C CNN
	1    6250 2500
	1    0    0    -1  
$EndComp
$Comp
L CPU:Z80CPU U1
U 1 1 5F0C1C0C
P 5350 3000
F 0 "U1" H 4850 4550 50  0000 C CNN
F 1 "Z80CPU" H 4950 4450 50  0000 C CNN
F 2 "" H 5350 3400 50  0001 C CNN
F 3 "www.zilog.com/manage_directlink.php?filepath=docs/z80/um0080" H 5350 3400 50  0001 C CNN
	1    5350 3000
	1    0    0    -1  
$EndComp
$EndSCHEMATC
