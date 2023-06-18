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
L power:GND #PWR01
U 1 1 5F27E935
P 4850 1800
F 0 "#PWR01" H 4850 1550 50  0001 C CNN
F 1 "GND" H 4855 1627 50  0000 C CNN
F 2 "" H 4850 1800 50  0001 C CNN
F 3 "" H 4850 1800 50  0001 C CNN
	1    4850 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_MountingPin J1
U 1 1 5F27D4C9
P 800 1100
F 0 "J1" H 857 1417 50  0000 C CNN
F 1 "Barrel Jack" H 857 1326 50  0000 C CNN
F 2 "" H 850 1060 50  0001 C CNN
F 3 "~" H 850 1060 50  0001 C CNN
	1    800  1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1400 3600 1550
$Comp
L power:+5V #PWR02
U 1 1 5F284187
P 4850 1100
F 0 "#PWR02" H 4850 950 50  0001 C CNN
F 1 "+5V" H 4865 1273 50  0000 C CNN
F 2 "" H 4850 1100 50  0001 C CNN
F 3 "" H 4850 1100 50  0001 C CNN
	1    4850 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1100 4150 1100
Wire Wire Line
	3050 1100 3300 1100
$Comp
L Device:C C2
U 1 1 5F282775
P 4150 1250
F 0 "C2" H 4265 1296 50  0000 L CNN
F 1 "22uf" H 4265 1205 50  0000 L CNN
F 2 "" H 4188 1100 50  0001 C CNN
F 3 "~" H 4150 1250 50  0001 C CNN
	1    4150 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5F281DAE
P 3050 1250
F 0 "C1" H 3165 1296 50  0000 L CNN
F 1 "22uf" H 3165 1205 50  0000 L CNN
F 2 "" H 3088 1100 50  0001 C CNN
F 3 "~" H 3050 1250 50  0001 C CNN
	1    3050 1250
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U1
U 1 1 5F280EE9
P 3600 1100
F 0 "U1" H 3600 1342 50  0000 C CNN
F 1 "L7805" H 3600 1251 50  0000 C CNN
F 2 "" H 3625 950 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 3600 1050 50  0001 C CNN
	1    3600 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5F29B826
P 4550 1250
F 0 "D2" V 4589 1132 50  0000 R CNN
F 1 "LED" V 4498 1132 50  0000 R CNN
F 2 "" H 4550 1250 50  0001 C CNN
F 3 "~" H 4550 1250 50  0001 C CNN
	1    4550 1250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 5F29CB06
P 4550 1550
F 0 "R2" H 4620 1596 50  0000 L CNN
F 1 "10k" H 4620 1505 50  0000 L CNN
F 2 "" V 4480 1550 50  0001 C CNN
F 3 "~" H 4550 1550 50  0001 C CNN
	1    4550 1550
	1    0    0    -1  
$EndComp
Connection ~ 4150 1100
Wire Wire Line
	4150 1100 4550 1100
Wire Wire Line
	3050 1550 3600 1550
Wire Wire Line
	3050 1400 3050 1550
Connection ~ 3600 1550
Wire Wire Line
	4150 1550 3600 1550
Wire Wire Line
	4150 1400 4150 1550
Connection ~ 1700 900 
Wire Wire Line
	1700 900  2450 900 
Wire Wire Line
	1500 900  1700 900 
$Comp
L Diode:1N4007 D3
U 1 1 5F28B5AA
P 1700 1450
F 0 "D3" V 1746 1530 50  0000 L CNN
F 1 "1N4007" V 1655 1530 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1700 1275 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 1700 1450 50  0001 C CNN
	1    1700 1450
	0    1    -1   0   
$EndComp
$Comp
L Diode:1N4007 D4
U 1 1 5F28AAFE
P 2450 1050
F 0 "D4" V 2496 1130 50  0000 L CNN
F 1 "1N4007" V 2405 1130 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2450 875 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2450 1050 50  0001 C CNN
	1    2450 1050
	0    1    -1   0   
$EndComp
$Comp
L Diode:1N4007 D1
U 1 1 5F285432
P 1700 1050
F 0 "D1" V 1654 1130 50  0000 L CNN
F 1 "1N4007" V 1745 1130 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1700 875 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 1700 1050 50  0001 C CNN
	1    1700 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	1700 1250 1700 1300
Wire Wire Line
	1700 1200 1700 1250
Connection ~ 1700 1250
Wire Wire Line
	1700 1250 2150 1250
Connection ~ 1700 1600
Wire Wire Line
	2150 1250 2150 1700
Wire Wire Line
	1700 1600 2450 1600
$Comp
L Diode:1N4007 D5
U 1 1 5F288DAE
P 2450 1450
F 0 "D5" V 2404 1530 50  0000 L CNN
F 1 "1N4007" V 2495 1530 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 2450 1275 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2450 1450 50  0001 C CNN
	1    2450 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 1550 3600 1700
$Comp
L Switch:SW_DPDT_x2 SW1
U 1 1 5F2BD9FE
P 1300 1000
F 0 "SW1" H 1300 1285 50  0000 C CNN
F 1 "Power switch" H 1300 1194 50  0000 C CNN
F 2 "" H 1300 1000 50  0001 C CNN
F 3 "~" H 1300 1000 50  0001 C CNN
	1    1300 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1200 2450 1250
Wire Wire Line
	2450 1250 2900 1250
Wire Wire Line
	2900 1250 2900 1100
Wire Wire Line
	2900 1100 3050 1100
Connection ~ 2450 1250
Wire Wire Line
	2450 1250 2450 1300
Connection ~ 3050 1100
Wire Wire Line
	2150 1700 3600 1700
Connection ~ 3600 1700
Wire Wire Line
	3600 1700 4550 1700
Wire Wire Line
	4850 1700 4850 1800
Wire Wire Line
	1100 1200 1100 1400
Wire Wire Line
	1100 1600 1700 1600
Wire Wire Line
	800  1400 1100 1400
Connection ~ 1100 1400
Wire Wire Line
	1100 1400 1100 1600
Wire Wire Line
	4550 1700 4850 1700
Connection ~ 4550 1700
Wire Wire Line
	4550 1100 4850 1100
Connection ~ 4550 1100
$Comp
L CPU:Z80CPU U1
U 1 1 5F0C1C0C
P 8000 2300
F 0 "U1" H 7500 3850 50  0000 C CNN
F 1 "Z80CPU" H 7600 3750 50  0000 C CNN
F 2 "" H 8000 2700 50  0001 C CNN
F 3 "www.zilog.com/manage_directlink.php?filepath=docs/z80/um0080" H 8000 2700 50  0001 C CNN
	1    8000 2300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x16 J1
U 1 1 5F0C433B
P 8900 1800
F 0 "J1" H 8980 1792 50  0000 L CNN
F 1 "Conn_01x16" H 8980 1701 50  0000 L CNN
F 2 "" H 8900 1800 50  0001 C CNN
F 3 "~" H 8900 1800 50  0001 C CNN
	1    8900 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J2
U 1 1 5F0C521D
P 8900 3100
F 0 "J2" H 8980 3092 50  0000 L CNN
F 1 "Conn_01x08" H 8980 3001 50  0000 L CNN
F 2 "" H 8900 3100 50  0001 C CNN
F 3 "~" H 8900 3100 50  0001 C CNN
	1    8900 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3100 6850 3100
Wire Wire Line
	6850 3100 6850 4100
Wire Wire Line
	7300 3000 6700 3000
Wire Wire Line
	6700 3000 6700 4200
Wire Wire Line
	7300 2900 6600 2900
Wire Wire Line
	6600 2900 6600 4300
Wire Wire Line
	7300 2800 6500 2800
Wire Wire Line
	6500 2800 6500 4400
Wire Wire Line
	7300 2100 6400 2100
Wire Wire Line
	6400 2100 6400 4500
Wire Wire Line
	7300 1400 6200 1400
Wire Wire Line
	6200 1400 6200 4700
Wire Wire Line
	7300 1100 6100 1100
Wire Wire Line
	6100 1100 6100 4800
$Comp
L power:GNDREF #PWR?
U 1 1 5F0C8EC8
P 8000 3800
F 0 "#PWR?" H 8000 3550 50  0001 C CNN
F 1 "GNDREF" H 8005 3627 50  0000 C CNN
F 2 "" H 8000 3800 50  0001 C CNN
F 3 "" H 8000 3800 50  0001 C CNN
	1    8000 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 5F0C9845
P 10450 1750
F 0 "J4" H 10530 1792 50  0000 L CNN
F 1 "Conn_01x01" H 10530 1701 50  0000 L CNN
F 2 "" H 10450 1750 50  0001 C CNN
F 3 "~" H 10450 1750 50  0001 C CNN
	1    10450 1750
	1    0    0    -1  
$EndComp
Text GLabel 7300 2400 0    50   Input ~ 0
HALT
Text GLabel 10250 1750 0    50   Input ~ 0
HALT
$Comp
L power:GNDREF #PWR?
U 1 1 5F0CC508
P 9750 3300
F 0 "#PWR?" H 9750 3050 50  0001 C CNN
F 1 "GNDREF" H 9755 3127 50  0000 C CNN
F 2 "" H 9750 3300 50  0001 C CNN
F 3 "" H 9750 3300 50  0001 C CNN
	1    9750 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C1
U 1 1 5F0CD2F4
P 9750 3150
F 0 "C1" H 9865 3196 50  0000 L CNN
F 1 "100uF" H 9865 3105 50  0000 L CNN
F 2 "" H 9750 3150 50  0001 C CNN
F 3 "~" H 9750 3150 50  0001 C CNN
	1    9750 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0CE803
P 9750 3000
F 0 "#PWR?" H 9750 2850 50  0001 C CNN
F 1 "+5V" H 9765 3173 50  0000 C CNN
F 2 "" H 9750 3000 50  0001 C CNN
F 3 "" H 9750 3000 50  0001 C CNN
	1    9750 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5F0D4D60
P 10250 3300
F 0 "#PWR?" H 10250 3050 50  0001 C CNN
F 1 "GNDREF" H 10255 3127 50  0000 C CNN
F 2 "" H 10250 3300 50  0001 C CNN
F 3 "" H 10250 3300 50  0001 C CNN
	1    10250 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C2
U 1 1 5F0D4D66
P 10250 3150
F 0 "C2" H 10365 3196 50  0000 L CNN
F 1 "100uF" H 10365 3105 50  0000 L CNN
F 2 "" H 10250 3150 50  0001 C CNN
F 3 "~" H 10250 3150 50  0001 C CNN
	1    10250 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0D4D6C
P 10250 3000
F 0 "#PWR?" H 10250 2850 50  0001 C CNN
F 1 "+5V" H 10265 3173 50  0000 C CNN
F 2 "" H 10250 3000 50  0001 C CNN
F 3 "" H 10250 3000 50  0001 C CNN
	1    10250 3000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F0D53B9
P 8000 800
F 0 "#PWR?" H 8000 650 50  0001 C CNN
F 1 "+5V" H 8000 950 50  0000 C CNN
F 2 "" H 8000 800 50  0001 C CNN
F 3 "" H 8000 800 50  0001 C CNN
	1    8000 800 
	1    0    0    -1  
$EndComp
Text GLabel 7300 2300 0    50   Input ~ 0
WAIT
Text GLabel 7300 1700 0    50   Input ~ 0
NMI
$Comp
L power:+5V #PWR?
U 1 1 5F0D74D5
P 10350 950
F 0 "#PWR?" H 10350 800 50  0001 C CNN
F 1 "+5V" H 10365 1123 50  0000 C CNN
F 2 "" H 10350 950 50  0001 C CNN
F 3 "" H 10350 950 50  0001 C CNN
	1    10350 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5F0D7E8E
P 10350 1100
F 0 "R1" H 10420 1146 50  0000 L CNN
F 1 "1K" H 10420 1055 50  0000 L CNN
F 2 "" V 10280 1100 50  0001 C CNN
F 3 "~" H 10350 1100 50  0001 C CNN
	1    10350 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F0DD590
P 10650 1100
F 0 "R2" H 10720 1146 50  0000 L CNN
F 1 "1K" H 10720 1055 50  0000 L CNN
F 2 "" V 10580 1100 50  0001 C CNN
F 3 "~" H 10650 1100 50  0001 C CNN
	1    10650 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5F0E0AF0
P 10950 1100
F 0 "R3" H 11020 1146 50  0000 L CNN
F 1 "1K" H 11020 1055 50  0000 L CNN
F 2 "" V 10880 1100 50  0001 C CNN
F 3 "~" H 10950 1100 50  0001 C CNN
	1    10950 1100
	1    0    0    -1  
$EndComp
Text GLabel 7300 3400 0    50   Input ~ 0
BUSREQ
Text GLabel 7300 3500 0    50   Input ~ 0
BUSACK
Wire Wire Line
	7300 1800 6300 1800
Wire Wire Line
	6300 1800 6300 4600
Text GLabel 10250 1250 0    50   Input ~ 0
BUSREQ
Text GLabel 10250 1400 0    50   Input ~ 0
BUSACK
Text GLabel 10250 1550 0    50   Input ~ 0
WAIT
Wire Wire Line
	10250 1250 10350 1250
Wire Wire Line
	10250 1400 10650 1400
Wire Wire Line
	10250 1550 10950 1550
Wire Wire Line
	10350 950  10650 950 
Connection ~ 10350 950 
Wire Wire Line
	10650 950  10950 950 
Connection ~ 10650 950 
Wire Wire Line
	10650 1250 10650 1400
Wire Wire Line
	10950 1250 10950 1550
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 5F0F7083
P 10450 1950
F 0 "J5" H 10530 1992 50  0000 L CNN
F 1 "Conn_01x01" H 10530 1901 50  0000 L CNN
F 2 "" H 10450 1950 50  0001 C CNN
F 3 "~" H 10450 1950 50  0001 C CNN
	1    10450 1950
	1    0    0    -1  
$EndComp
Text GLabel 10250 1950 0    50   Input ~ 0
NMI
$Comp
L Connector_Generic:Conn_01x08 J3
U 1 1 5F0C5AA5
P 7050 4500
F 0 "J3" H 7130 4492 50  0000 L CNN
F 1 "Conn_01x08" H 7130 4401 50  0000 L CNN
F 2 "" H 7050 4500 50  0001 C CNN
F 3 "~" H 7050 4500 50  0001 C CNN
	1    7050 4500
	1    0    0    1   
$EndComp
Wire Wire Line
	6700 4200 6850 4200
Wire Wire Line
	6850 4300 6600 4300
Wire Wire Line
	6500 4400 6850 4400
Wire Wire Line
	6850 4500 6400 4500
Wire Wire Line
	6300 4600 6850 4600
Wire Wire Line
	6850 4700 6200 4700
Wire Wire Line
	6100 4800 6850 4800
$EndSCHEMATC
