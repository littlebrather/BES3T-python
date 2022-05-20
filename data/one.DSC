#DESC	1.2 * DESCRIPTOR INFORMATION ***********************
*
*	Dataset Type and Format:
*
DSRC	EXP
BSEQ	BIG
IKKF	REAL
XTYP	IDX
YTYP	NODATA
ZTYP	NODATA
*
*	Item Formats:
*
IRFMT	D
*
*	Data Ranges and Resolutions:
*
XPTS	4096
XMIN	0.000000
XWID	7000.000000
*
*	Documentational Text:
*
TITL	'empt3'
IRNAM	'Intensity'
XNAM	'Field'
IRUNI	''
XUNI	'G'
*
************************************************************
*
#SPL	1.2 * STANDARD PARAMETER LAYER
*
OPER    xuser
DATE    09/17/21
TIME    14:29:51
CMNT    
SAMP    
SFOR    
STAG    C
EXPT    CW
OXS1    IADC
AXS1    B0VL
AXS2    NONE
AXS3    
A1CT    0.35
A1SW    0.7
MWFQ    9.58713e+09
MWPW    0.002019
AVGS    1
RESO    HT0703
SPTP    0.01024
RCAG    20
RCHM    1
B0MA    0.0004
B0MF    100000
RCPH    180.0
RCOF    0.0
A1RS    4096
RCTC    0.01024
STMP    288
*
************************************************************
*
#DSL	1.0 * DEVICE SPECIFIC LAYER
*

.DVC     acqStart, 1.0


.DVC     fieldCtrl, 1.0

AllegroMode        False
CenterField        3500.00 G
Delay              0.0 s
FieldFlyback       On
FieldResol         1.70898
FieldWait          Wait stable
GFactor            2.000000
SetToSampleG       False
SweepDirection     Up
SweepWidth         7000.0 G

.DVC     fieldSweep, 1.0


.DVC     freqCounter, 1.0

FrequencyMon       9.587130 GHz
QMonitBridge       On

.DVC     mwBridge, 1.0

AcqFineTuning      Never
AcqScanFTuning     No Scan
AcqSliceFTuning    No Slice
Power              2.019 mW
PowerAtten         20 dB

.DVC     recorder, 1.0

BaselineCorr       Off
NbScansAcc         1
NbScansDone        1
NbScansToDo        1
ReplaceMode        Off

.DVC     scanEnd, 1.0


.DVC     signalChannel, 1.0

AFCTrap            True
AllegroMode        False
Calibrated         True
ConvTime           10.24 ms
DModAFCTrap        True
DModAmp            1.00 G
DModCalibrated     True
DModDetectSCT      First
DModEliDelay       1.0 us
DModExtLockIn      False
DModExtTrigger     False
DModFieldMod       First
DModGain           60 dB
DModHighPass       True
DModIntegrator     True
DModModOutput      Internal
DModSignalInput    Internal
DModTimeConst      1.28 ms
DoubleModFreq      5.00 kHz
DoubleModPhase     0.0
DoubleMode         False
EliDelay           1.0 us
EnableImag         Disable
ExtLockIn          False
ExtTrigger         False
Gain               20 dB
Harmonic           1
HighPass           True
Integrator         False
ModAmp             4.00 G
ModFreq            100.00 kHz
ModInput           Internal
ModOutput          Internal
ModPhase           180.0
Offset             0.0 %
QuadMode           False
QuadPhase          90.0
Resolution         4096
Resonator          1
SamplingTime       10.24 ms
SctNorm            False
SctRevision        DSC2
SignalInput        Internal
SweepTime          41.94 s
TimeConst          10.24 ms
TimeExp            False
TuneCaps           12

.DVC     tempCtrl, 1.0

AcqWaitTime        5.0 s
Temperature        288.00 K
Tolerance          1.00 K

*
************************************************************
