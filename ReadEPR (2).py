# -*- coding: utf-8 -*-

import numpy as np

def readDSC(FileName):
    Parameters = {}
    with open(FileName, 'r') as file:
        for line in file:
            
            if (line=="\n"):
                continue
            elif (line[0] == '*'): #There are some lines in my file containing *** only which are annoying
                continue
            else:
                #keyvalue = line.replace("\t", "  ").split(' ',1)
                if (len(line.replace("\t", "  ").split(' ',1))<=1):
                    continue
                else:
                    key, value = line.replace("\t", "  ").split(' ',1)
            if (key == '#MHL'): break
        
                #there are two parts in parameters file I use Standart Parameters Layer and Device Speciefic Layer, 
                # with whitespaces been '\t' in first and 4*' ' in second
            Parameters[key.strip()] = value.strip()
    # Here the function return full dict of Parameters, both keys and values been str
                
    return Parameters

def readDTA(FileName, Parameters):
    # NoScaling is used by default. Should be switched to Scaling only if you are sure nothing is lost in Coefficient section
    Dimension = []
    Xpoints1 = 1
    Xpoints2 = 1
    Xpoints3 = 1
    DataFormat = {'D':'f8','F':'f4','I':'i4','S':'i2' }
    if (Parameters['BSEQ'] == 'BIG'):
        Byteorder = '>'
    else:
        Byteorder = '<'
    # X axis
    if (Parameters['XTYP'] != 'NODATA'):
        Xpoints1 = int(Parameters['XPTS'])
    else:
        Dimension.append(0)
    # Y axis

    if (Parameters['YTYP'] != 'NODATA'):
        Xpoints2 = int(Parameters['YPTS'])
    else:
        Dimension.append(1)
    # Z axis    
    if (Parameters['ZTYP'] != 'NODATA'):
        Xpoints3 = int(Parameters['ZPTS'])
    else:
        Dimension.append(2)
    if (Parameters['IKKF'] == 'REAL'):
        DataType = np.dtype(Byteorder+DataFormat[Parameters['IRFMT']])
        Yinput = np.fromfile(FileName , dtype = DataType)
    elif(Parameters['IKKF'] == 'CPLX'):
        Yinput = np.fromfile(FileName , dtype = '>c16')
    Yarray = np.reshape(Yinput,(Xpoints1,Xpoints2,Xpoints3),order = 'F')
    #Ydata is shaped in Fortran-like style
    #Xdata = [Xdata1,Xdata2,Xdata3]
    Ydata = np.squeeze(Yarray,tuple(Dimension))
    return Ydata

def readEPR(FileName, Scaling=None):
    
    if(FileName[-4] == '.'):
        FileNameCut = FileName[0:-4]
    else:
        FileNameCut = FileName
    Parameters = readDSC(FileNameCut + '.DSC')
    Dimension = 3
    # protection in case wrong or no file extension is sent
    DataFormat = {'D':'f8','F':'f4','I':'i4','S':'i2' }
    if (Parameters['BSEQ'] == 'BIG'):
        Byteorder = '>'
    else:
        Byteorder = '<'
    # X axis
    if (Parameters['XTYP'] != 'NODATA'):
        Xmin1 = float(Parameters['XMIN'])
        Xwid1 = float(Parameters['XWID'])
        Xpoints1 = int(Parameters['XPTS'])
    if (Parameters['XTYP'] == 'IGD'):
        DataType1 = np.dtype(Byteorder+DataFormat[Parameters['XFMT']])
        Xdata1 = np.fromfile(FileNameCut+ '.XGF' , dtype = DataType1)
    elif (Parameters['XTYP'] == 'IDX'):
        Xdata1 = np.linspace(Xmin1,Xmin1+Xwid1,Xpoints1)
    else:
        Xdata1 = None
        Dimension - 1
    # Y axis

    if (Parameters['YTYP'] != 'NODATA'):
        Xmin2 = float(Parameters['YMIN'])
        Xwid2 = float(Parameters['YWID'])
        Xpoints2 = int(Parameters['YPTS'])
        
    if (Parameters['YTYP'] == 'IGD'):
        DataType2 = np.dtype(Byteorder+DataFormat[Parameters['YFMT']])
        Xdata2 = np.fromfile(FileNameCut+ '.YGF' , dtype = DataType2)
    elif (Parameters['YTYP'] == 'IDX'):
        Xdata2 = np.linspace(Xmin2,Xmin2+Xwid2,Xpoints2)
    else:
        Xdata2 = None
        Dimension - 1
    # Z axis    
    if (Parameters['ZTYP'] != 'NODATA'):
        Xmin3 = float(Parameters['ZMIN'])
        Xwid3 = float(Parameters['ZWID'])
        Xpoints3 = int(Parameters['ZPTS'])
        
    if (Parameters['ZTYP'] == 'IGD'):
        DataType3 = np.dtype(Byteorder+DataFormat[Parameters['ZFMT']])
        Xdata3 = np.fromfile(FileNameCut+ '.ZGF' , dtype = DataType3)
    elif (Parameters['ZTYP'] == 'IDX'):
        Xdata3 = np.linspace(Xmin3,Xmin3+Xwid3,Xpoints3)
    else:
        Xdata3 = None
        Dimension - 1        
    #DataType = np.dtype(Byteorder+DataFormat[Parameters['IRFMT']])
    Yinput = readDTA(FileNameCut+ '.DTA' , Parameters)
    if (Parameters['EXPT'] == 'CW' ):
        FileScaling = Parameters['SctNorm']
    else:
        FileScaling = 'True'
    if (Scaling == None):
    # You can specifically ask to scale the data, in that case check Coefficient formula
        Coefficient = 1
    elif(FileScaling == 'True'):
    # in case autoscaling is performed by device and you are somehow unaware of it
        Coefficient = 1
    else:
        NumberAVGS = int(Parameters['AVGS'])
        RecieverGaindB = float(Parameters['RCAG'])
        RecieverGain = 10 ** (RecieverGaindB//20)
        MicrowavePower = float(Parameters['MWPW'])
        # the scaling I perform for my setup exclusively. Should be rewritten to become universal. 
        Coefficient = NumberAVGS*RecieverGain*MicrowavePower**0.5
    Ydata = Yinput/Coefficient
    Xdata = [Xdata1,Xdata2,Xdata3]
    return Xdata, Ydata

            
            