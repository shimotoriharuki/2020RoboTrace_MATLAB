#ifndef RTW_HEADER_Simulation_CircularSensor_h_
#define RTW_HEADER_Simulation_CircularSensor_h_
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "rtw_modelmap.h"
#ifndef Simulation_CircularSensor_COMMON_INCLUDES_
#define Simulation_CircularSensor_COMMON_INCLUDES_
#include <stdlib.h>
#include "rtwtypes.h"
#include "simtarget/slSimTgtSigstreamRTW.h"
#include "simtarget/slSimTgtSlioCoreRTW.h"
#include "simtarget/slSimTgtSlioClientsRTW.h"
#include "simtarget/slSimTgtSlioSdiRTW.h"
#include "sigstream_rtw.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "slsv_diagnostic_codegen_c_api.h"
#include "rt_logging.h"
#include "dt_info.h"
#include "ext_work.h"
#endif
#include "Simulation_CircularSensor_types.h"
#include "multiword_types.h"
#include "rtGetNaN.h"
#include "rt_nonfinite.h"
#include "mwmathutil.h"
#include "rt_defines.h"
#include "rtGetInf.h"
#define MODEL_NAME Simulation_CircularSensor
#define NSAMPLE_TIMES (3) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (15) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (0)   
#elif NCSTATES != 0
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (*rt_dataMapInfoPtr)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val) (rt_dataMapInfoPtr = &val)
#endif
#ifndef IN_RACCEL_MAIN
#endif
typedef struct { real_T hgvcypb44z ; real_T ofuexryd5s ; real_T lw0eucomel ;
real_T jvxitaw4eg [ 3 ] ; real_T i5igcfvlny ; real_T ddiciehpze ; real_T
gd1faqqhf2 [ 40 ] ; real_T jumjq2t40g [ 1000000 ] ; real_T pq4oqj1ftp ;
real_T n1gggjnnco ; real_T pjgcsw34ma ; real_T f5eb0air2b ; real_T mqse2qzydk
; real_T eglqpzmyql ; real_T koeh140u5g ; } B ; typedef struct { real_T
bduzutfccm ; real_T erly5mzpqu ; real_T hmodxnmmkt ; real_T ob2ec14xe1 [
1000000 ] ; real_T fhpdmjxep0 ; real_T ksa3xgmiqj ; real_T okcpqnsmiw ;
real_T lbb42b2aei ; real_T hknj5qhj2i ; real_T m1qnoszbqg ; struct { void *
LoggedData ; } m3nzbucckd ; struct { void * LoggedData ; } f20m2zfiki ;
struct { void * LoggedData [ 2 ] ; } ekhy4r2klw ; struct { void * LoggedData
; } af1vwlxkji ; struct { void * LoggedData ; } ncyke2zkxu ; int32_T
orevitufji [ 2 ] ; int32_T odc1vrxcnj [ 2 ] ; int32_T mub0cybqzq ; uint32_T
psqpiuobuv ; uint8_T frt1tkd2yf ; } DW ; typedef struct {
rtwCAPI_ModelMappingInfo mmi ; } DataMapInfo ; struct P_ { real_T L ; real_T
Pixels [ 1000000 ] ; real_T SensorAngle ; real_T SensorNumber ; real_T
SensorRadius ; real_T SensorRange ; real_T Tvelo ; real_T scale ; real_T
DiscreteTimeIntegrator2_gainval ; real_T DiscreteTimeIntegrator2_IC ; real_T
DiscreteTimeIntegrator1_gainval ; real_T DiscreteTimeIntegrator1_IC ; real_T
DiscreteTimeIntegrator_gainval ; real_T DiscreteTimeIntegrator_IC ; real_T
DataStoreMemory1_InitialValue ; real_T DataStoreMemory2_InitialValue ; real_T
DataStoreMemory3_InitialValue ; real_T DataStoreMemory4_InitialValue ; real_T
DataStoreMemory5_InitialValue ; real_T DataStoreMemory7_InitialValue ; } ;
extern const char * RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern DW
rtDW ; extern P rtP ; extern const rtwCAPI_ModelMappingStaticInfo *
Simulation_CircularSensor_GetCAPIStaticMap ( void ) ; extern SimStruct *
const rtS ; extern const int_T gblNumToFiles ; extern const int_T
gblNumFrFiles ; extern const int_T gblNumFrWksBlocks ; extern rtInportTUtable
* gblInportTUtables ; extern const char * gblInportFileName ; extern const
int_T gblNumRootInportBlks ; extern const int_T gblNumModelInputs ; extern
const int_T gblInportDataTypeIdx [ ] ; extern const int_T gblInportDims [ ] ;
extern const int_T gblInportComplex [ ] ; extern const int_T
gblInportInterpoFlag [ ] ; extern const int_T gblInportContinuous [ ] ;
extern const int_T gblParameterTuningTid ; extern DataMapInfo *
rt_dataMapInfoPtr ; extern rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr ;
void MdlOutputs ( int_T tid ) ; void MdlOutputsParameterSampleTime ( int_T
tid ) ; void MdlUpdate ( int_T tid ) ; void MdlTerminate ( void ) ; void
MdlInitializeSizes ( void ) ; void MdlInitializeSampleTimes ( void ) ;
SimStruct * raccel_register_model ( void ) ;
#endif
