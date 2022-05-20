#DESC	1.2 * DESCRIPTOR INFORMATION ***********************
*
*	Dataset Type and Format:
*
DSRC	EXP
BSEQ	BIG
IKKF	REAL
XTYP	IDX
YTYP	IGD
ZTYP	NODATA
*
*	Item Formats:
*
IRFMT	D
YFMT	D
*
*	Data Ranges and Resolutions:
*
XPTS	1024
XMIN	2850.000000
XWID	1000.000000
YPTS	72
YMIN	0.000000
YWID	355.000000
*
*	Documentational Text:
*
TITL	'FeSO4x7H2O_13'
IRNAM	'Intensity'
XNAM	'Field'
YNAM	'Sample Angle'
IRUNI	''
XUNI	'G'
YUNI	'deg'
*
************************************************************
*
#SPL	1.2 * STANDARD PARAMETER LAYER
*
OPER    xuser
DATE    11/19/08
TIME    16:31:24
CMNT    
SAMP    
SFOR    
STAG    C
EXPT    CW
OXS1    IADC
AXS1    B0VL
AXS2    SANX
AXS3    
A1CT    0.335
A1SW    0.1
MWFQ    9.782731e+09
SANX    355.000
MWPW    0.2005
A2RS    72
A2LL    0.000
A2SW    5.000
AVGS    5
RESO    st_01
SPTP    0.01024
RCAG    60
RCHM    1
B0MA    0.0004
B0MF    100000
RCPH    0.0
RCOF    0.0
A1RS    1024
RCTC    0.01024
*
************************************************************
*
#DSL	1.0 * DEVICE SPECIFIC LAYER
*

.DVC     acqStart, 1.0


.DVC     fieldCtrl, 1.0

AllegroMode        False
CenterField        3350.00 G
Delay              4.0 s
FieldFlyback       On
FieldResol         0.97656
FieldWait          Wait stable
GFactor            10.000000
SetToSampleG       False
SweepDirection     Up
SweepWidth         1000.0 G

.DVC     fieldSweep, 1.0


.DVC     freqCounter, 1.0

FrequencyMon       9.782731 GHz
QMonitBridge       On

.DVC     goniometer, 1.0

Angle              355.000 deg
Increment          0.125 deg
InfoText           Connect to Hardware - Initialize Goniometer - Define Zero Angle
Type               SD_Goniometer

.DVC     mwBridge, 1.0

AcqFineTuning      Each Slice Scan
AcqScanFTuning     No Scan
AcqSliceFTuning    No Slice
Power              200.5 mW
PowerAtten         0 dB

.DVC     ramp2, 1.0

Flyback            False
NbPoints           72
StartValue         0.000 deg
SweepData           deg
SweepWidth         5.000 deg
sweepType          Ramp up

.DVC     recorder, 1.0

BaselineCorr       Off
NbScansAcc         5
NbScansDone        5
NbScansToDo        5
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
Gain               60 dB
Harmonic           1
HighPass           True
Integrator         False
ModAmp             4.00 G
ModFreq            100.00 kHz
ModInput           Internal
ModOutput          Internal
ModPhase           0.0
Offset             0.0 %
QuadMode           False
QuadPhase          90.0
Resolution         1024
Resonator          1
SamplingTime       10.24 ms
SctNorm            False
SctRevision        DSC2
SignalInput        Internal
SweepTime          10.49 s
TimeConst          10.24 ms
TimeExp            False
TuneCaps           31

*
************************************************************
*
#MHL	1.0 * MANIPULATION HISTORY LAYER by BRUKER
*
MACRO On_display1D
vpDspType $Viewport $Dataset line
vpColor $Viewport $Dataset 13
END_MACRO
MACRO On_display2D
vpDspType $Viewport $Dataset 
vp2DZCurve $Viewport 0.000000
vp2DZCenter $Viewport 26
vp2DColorScheme $Viewport b&w
vp2DProjection $Viewport roof
vp2DZRange $Viewport 0.000000 3953673.000000
vpColor $Viewport $Dataset 1
END_MACRO
*
************************************************************
