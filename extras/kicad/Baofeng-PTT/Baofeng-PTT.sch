EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 8268 11693 portrait
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
L Connector:Conn_01x04_Female J8
U 1 1 5EFC2AC7
P 3700 3150
F 0 "J8" H 3728 3126 50  0000 L CNN
F 1 "Baofeng" H 3728 3035 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3700 3150 50  0001 C CNN
F 3 "~" H 3700 3150 50  0001 C CNN
	1    3700 3150
	1    0    0    -1  
$EndComp
$Comp
L Transistor_Array:ULN2003 U1
U 1 1 5EFC6706
P 2100 1200
F 0 "U1" H 2100 1867 50  0000 C CNN
F 1 "ULN2003" H 2100 1776 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 2150 650 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2003a.pdf" H 2200 1000 50  0001 C CNN
	1    2100 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5EFC8A3C
P 2100 1800
F 0 "#PWR0101" H 2100 1550 50  0001 C CNN
F 1 "GND" H 2105 1627 50  0000 C CNN
F 2 "" H 2100 1800 50  0001 C CNN
F 3 "" H 2100 1800 50  0001 C CNN
	1    2100 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EFE0C03
P 1200 1100
F 0 "#PWR0102" H 1200 850 50  0001 C CNN
F 1 "GND" H 1205 927 50  0000 C CNN
F 2 "" H 1200 1100 50  0001 C CNN
F 3 "" H 1200 1100 50  0001 C CNN
	1    1200 1100
	1    0    0    -1  
$EndComp
Text GLabel 3500 3050 0    50   Output ~ 0
AO
Text GLabel 3500 3150 0    50   Output ~ 0
PT
Text GLabel 3500 3350 0    50   Output ~ 0
AI
Wire Wire Line
	1100 2650 1100 2550
$Comp
L Connector:AudioJack3 J2
U 1 1 5EFBD973
P 900 2650
F 0 "J2" H 882 2975 50  0000 C CNN
F 1 "AO" H 882 2884 50  0000 C CNN
F 2 "User:Audio_5conn" H 900 2650 50  0001 C CNN
F 3 "~" H 900 2650 50  0001 C CNN
	1    900  2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5EFBE4B9
P 3500 3250
F 0 "#PWR0103" H 3500 3000 50  0001 C CNN
F 1 "GND" H 3505 3077 50  0000 C CNN
F 2 "" H 3500 3250 50  0001 C CNN
F 3 "" H 3500 3250 50  0001 C CNN
	1    3500 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	1200 3600 1200 3700
Text GLabel 1800 2800 2    50   Input ~ 0
AO
$Comp
L power:GND #PWR0104
U 1 1 5EFDF504
P 1800 2700
F 0 "#PWR0104" H 1800 2450 50  0001 C CNN
F 1 "GND" H 1805 2527 50  0000 C CNN
F 2 "" H 1800 2700 50  0001 C CNN
F 3 "" H 1800 2700 50  0001 C CNN
	1    1800 2700
	0    -1   -1   0   
$EndComp
Text GLabel 2500 1000 2    50   Input ~ 0
PT
Wire Wire Line
	1200 4000 1200 3800
Wire Wire Line
	1100 2950 1100 2750
Text GLabel 1000 1000 0    50   Input ~ 0
PIN
Text GLabel 1000 1100 0    50   Input ~ 0
GND
$Comp
L Connector:AudioJack3 J1
U 1 1 5EFBCD1E
P 1000 3700
F 0 "J1" H 982 4025 50  0000 C CNN
F 1 "AI" H 982 3934 50  0000 C CNN
F 2 "User:Audio_5conn" H 1000 3700 50  0001 C CNN
F 3 "~" H 1000 3700 50  0001 C CNN
	1    1000 3700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5EFD44E9
P 1000 1000
F 0 "J4" H 1250 950 50  0000 C CNN
F 1 "PTT" H 900 1150 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1000 1000 50  0001 C CNN
F 3 "~" H 1000 1000 50  0001 C CNN
	1    1000 1000
	1    0    0    -1  
$EndComp
Text GLabel 1900 3850 2    50   Input ~ 0
AI
$Comp
L power:GND #PWR0105
U 1 1 5EFDFA96
P 1900 3750
F 0 "#PWR0105" H 1900 3500 50  0001 C CNN
F 1 "GND" H 1905 3577 50  0000 C CNN
F 2 "" H 1900 3750 50  0001 C CNN
F 3 "" H 1900 3750 50  0001 C CNN
	1    1900 3750
	0    -1   -1   0   
$EndComp
$Comp
L Device:Ferrite_Bead FB3
U 1 1 60F3E249
P 1350 3600
F 0 "FB3" V 1076 3600 50  0000 C CNN
F 1 "Ferrite_Bead" V 1167 3600 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 1280 3600 50  0001 C CNN
F 3 "~" H 1350 3600 50  0001 C CNN
	1    1350 3600
	0    1    1    0   
$EndComp
$Comp
L Device:Ferrite_Bead FB4
U 1 1 60F44711
P 1350 4000
F 0 "FB4" V 1076 4000 50  0000 C CNN
F 1 "Ferrite_Bead" V 1167 4000 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 1280 4000 50  0001 C CNN
F 3 "~" H 1350 4000 50  0001 C CNN
	1    1350 4000
	0    1    1    0   
$EndComp
Connection ~ 1200 3600
Wire Wire Line
	1500 3600 1900 3600
Wire Wire Line
	1900 3600 1900 3750
Wire Wire Line
	1500 4000 1900 4000
Wire Wire Line
	1900 4000 1900 3850
$Comp
L Device:Ferrite_Bead FB1
U 1 1 60F6D485
P 1250 2550
F 0 "FB1" V 976 2550 50  0000 C CNN
F 1 "Ferrite_Bead" V 1067 2550 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 1180 2550 50  0001 C CNN
F 3 "~" H 1250 2550 50  0001 C CNN
	1    1250 2550
	0    1    1    0   
$EndComp
$Comp
L Device:Ferrite_Bead FB2
U 1 1 60F6D48B
P 1250 2950
F 0 "FB2" V 976 2950 50  0000 C CNN
F 1 "Ferrite_Bead" V 1067 2950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 1180 2950 50  0001 C CNN
F 3 "~" H 1250 2950 50  0001 C CNN
	1    1250 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 2550 1800 2550
Wire Wire Line
	1400 2950 1800 2950
Wire Wire Line
	1800 2550 1800 2700
Wire Wire Line
	1800 2950 1800 2800
$Comp
L pspice:R R0
U 1 1 60F7F084
P 1450 1000
F 0 "R0" V 1245 1000 50  0000 C CNN
F 1 "R0" V 1336 1000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 1450 1000 50  0001 C CNN
F 3 "~" H 1450 1000 50  0001 C CNN
	1    1450 1000
	0    1    1    0   
$EndComp
Text Notes 1450 3350 0    50   ~ 0
(Optional) Ferrite beads FB0-FB4\nusing for filtering audio\n\n
$EndSCHEMATC
