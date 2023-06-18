EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 5512 4016
encoding utf-8
Sheet 1 1
Title "Power module"
Date "2020-08-03"
Rev "2"
Comp "Peter Holt"
Comment1 "Uses a DC barrel jack, input 5-12v"
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
$EndSCHEMATC
