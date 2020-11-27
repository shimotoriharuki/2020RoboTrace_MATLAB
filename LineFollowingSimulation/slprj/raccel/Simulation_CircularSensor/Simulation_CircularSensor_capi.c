#include "rtw_capi.h"
#ifdef HOST_CAPI_BUILD
#include "Simulation_CircularSensor_capi_host.h"
#define sizeof(s) ((size_t)(0xFFFF))
#undef rt_offsetof
#define rt_offsetof(s,el) ((uint16_T)(0xFFFF))
#define TARGET_CONST
#define TARGET_STRING(s) (s)    
#else
#include "builtin_typeid_types.h"
#include "Simulation_CircularSensor.h"
#include "Simulation_CircularSensor_capi.h"
#include "Simulation_CircularSensor_private.h"
#ifdef LIGHT_WEIGHT_CAPI
#define TARGET_CONST                  
#define TARGET_STRING(s)               (NULL)                    
#else
#define TARGET_CONST                   const
#define TARGET_STRING(s)               (s)
#endif
#endif
static const rtwCAPI_Signals rtBlockSignals [ ] = { { 0 , 1 , TARGET_STRING (
"Simulation_CircularSensor/CalcAngle" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 ,
0 , 0 } , { 1 , 2 , TARGET_STRING (
"Simulation_CircularSensor/CalcRotationVelo" ) , TARGET_STRING ( "W_c" ) , 0
, 0 , 0 , 0 , 0 } , { 2 , 3 , TARGET_STRING (
"Simulation_CircularSensor/Chart" ) , TARGET_STRING ( "" ) , 0 , 0 , 1 , 0 ,
0 } , { 3 , 3 , TARGET_STRING ( "Simulation_CircularSensor/Chart" ) ,
TARGET_STRING ( "" ) , 1 , 0 , 0 , 0 , 0 } , { 4 , 3 , TARGET_STRING (
"Simulation_CircularSensor/Chart" ) , TARGET_STRING ( "" ) , 2 , 0 , 0 , 0 ,
0 } , { 5 , 3 , TARGET_STRING ( "Simulation_CircularSensor/Chart" ) ,
TARGET_STRING ( "" ) , 3 , 0 , 0 , 0 , 0 } , { 6 , 3 , TARGET_STRING (
"Simulation_CircularSensor/Chart" ) , TARGET_STRING ( "" ) , 4 , 0 , 0 , 0 ,
0 } , { 7 , 3 , TARGET_STRING ( "Simulation_CircularSensor/Chart" ) ,
TARGET_STRING ( "" ) , 5 , 0 , 0 , 0 , 0 } , { 8 , 0 , TARGET_STRING (
"Simulation_CircularSensor/Chart/is_active_c5_Simulation_CircularSensor" ) ,
TARGET_STRING ( "is_active_c5_Simulation_CircularSensor" ) , 0 , 1 , 0 , 0 ,
0 } , { 9 , 0 , TARGET_STRING (
"Simulation_CircularSensor/Chart/is_c5_Simulation_CircularSensor" ) ,
TARGET_STRING ( "is_c5_Simulation_CircularSensor" ) , 0 , 2 , 0 , 0 , 0 } , {
10 , 5 , TARGET_STRING ( "Simulation_CircularSensor/GetSensPosCircular" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 2 , 0 , 0 } , { 11 , 0 , TARGET_STRING (
"Simulation_CircularSensor/Discrete-Time Integrator" ) , TARGET_STRING ( "" )
, 0 , 0 , 0 , 0 , 0 } , { 12 , 0 , TARGET_STRING (
"Simulation_CircularSensor/Gain" ) , TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0
} , { 13 , 0 , TARGET_STRING ( "Simulation_CircularSensor/Gain1" ) ,
TARGET_STRING ( "" ) , 0 , 0 , 0 , 0 , 0 } , { 14 , 0 , TARGET_STRING (
"Simulation_CircularSensor/CalcPosition/Product1" ) , TARGET_STRING ( "dy" )
, 0 , 0 , 0 , 0 , 0 } , { 15 , 0 , TARGET_STRING (
"Simulation_CircularSensor/CalcPosition/Product2" ) , TARGET_STRING ( "dx" )
, 0 , 0 , 0 , 0 , 0 } , { 0 , 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 , 0 , 0 } }
; static const rtwCAPI_BlockParameters rtBlockParameters [ ] = { { 16 ,
TARGET_STRING ( "Simulation_CircularSensor/Data Store Memory1" ) ,
TARGET_STRING ( "InitialValue" ) , 0 , 0 , 0 } , { 17 , TARGET_STRING (
"Simulation_CircularSensor/Data Store Memory2" ) , TARGET_STRING (
"InitialValue" ) , 0 , 0 , 0 } , { 18 , TARGET_STRING (
"Simulation_CircularSensor/Data Store Memory3" ) , TARGET_STRING (
"InitialValue" ) , 0 , 0 , 0 } , { 19 , TARGET_STRING (
"Simulation_CircularSensor/Data Store Memory4" ) , TARGET_STRING (
"InitialValue" ) , 0 , 0 , 0 } , { 20 , TARGET_STRING (
"Simulation_CircularSensor/Data Store Memory5" ) , TARGET_STRING (
"InitialValue" ) , 0 , 0 , 0 } , { 21 , TARGET_STRING (
"Simulation_CircularSensor/Data Store Memory7" ) , TARGET_STRING (
"InitialValue" ) , 0 , 0 , 0 } , { 22 , TARGET_STRING (
"Simulation_CircularSensor/Discrete-Time Integrator" ) , TARGET_STRING (
"gainval" ) , 0 , 0 , 0 } , { 23 , TARGET_STRING (
"Simulation_CircularSensor/Discrete-Time Integrator" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 24 , TARGET_STRING (
"Simulation_CircularSensor/Discrete-Time Integrator1" ) , TARGET_STRING (
"gainval" ) , 0 , 0 , 0 } , { 25 , TARGET_STRING (
"Simulation_CircularSensor/Discrete-Time Integrator1" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 26 , TARGET_STRING (
"Simulation_CircularSensor/Discrete-Time Integrator2" ) , TARGET_STRING (
"gainval" ) , 0 , 0 , 0 } , { 27 , TARGET_STRING (
"Simulation_CircularSensor/Discrete-Time Integrator2" ) , TARGET_STRING (
"InitialCondition" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , ( NULL ) , 0 , 0 , 0 }
} ; static const rtwCAPI_ModelParameters rtModelParameters [ ] = { { 28 ,
TARGET_STRING ( "L" ) , 0 , 0 , 0 } , { 29 , TARGET_STRING ( "Pixels" ) , 0 ,
1 , 0 } , { 30 , TARGET_STRING ( "SensorAngle" ) , 0 , 0 , 0 } , { 31 ,
TARGET_STRING ( "SensorNumber" ) , 0 , 0 , 0 } , { 32 , TARGET_STRING (
"SensorRadius" ) , 0 , 0 , 0 } , { 33 , TARGET_STRING ( "SensorRange" ) , 0 ,
0 , 0 } , { 34 , TARGET_STRING ( "Tvelo" ) , 0 , 0 , 0 } , { 35 ,
TARGET_STRING ( "scale" ) , 0 , 0 , 0 } , { 0 , ( NULL ) , 0 , 0 , 0 } } ;
#ifndef HOST_CAPI_BUILD
static void * rtDataAddrMap [ ] = { & rtB . koeh140u5g , & rtB . eglqpzmyql ,
& rtB . jumjq2t40g [ 0 ] , & rtB . pq4oqj1ftp , & rtB . n1gggjnnco , & rtB .
pjgcsw34ma , & rtB . f5eb0air2b , & rtB . mqse2qzydk , & rtDW . frt1tkd2yf ,
& rtDW . psqpiuobuv , & rtB . gd1faqqhf2 [ 0 ] , & rtB . lw0eucomel , & rtB .
hgvcypb44z , & rtB . ofuexryd5s , & rtB . i5igcfvlny , & rtB . ddiciehpze , &
rtP . DataStoreMemory1_InitialValue , & rtP . DataStoreMemory2_InitialValue ,
& rtP . DataStoreMemory3_InitialValue , & rtP . DataStoreMemory4_InitialValue
, & rtP . DataStoreMemory5_InitialValue , & rtP .
DataStoreMemory7_InitialValue , & rtP . DiscreteTimeIntegrator_gainval , &
rtP . DiscreteTimeIntegrator_IC , & rtP . DiscreteTimeIntegrator1_gainval , &
rtP . DiscreteTimeIntegrator1_IC , & rtP . DiscreteTimeIntegrator2_gainval ,
& rtP . DiscreteTimeIntegrator2_IC , & rtP . L , & rtP . Pixels [ 0 ] , & rtP
. SensorAngle , & rtP . SensorNumber , & rtP . SensorRadius , & rtP .
SensorRange , & rtP . Tvelo , & rtP . scale , } ; static int32_T *
rtVarDimsAddrMap [ ] = { ( NULL ) , & rtDW . orevitufji [ 0 ] } ;
#endif
static TARGET_CONST rtwCAPI_DataTypeMap rtDataTypeMap [ ] = { { "double" ,
"real_T" , 0 , 0 , sizeof ( real_T ) , SS_DOUBLE , 0 , 0 , 0 } , {
"unsigned char" , "uint8_T" , 0 , 0 , sizeof ( uint8_T ) , SS_UINT8 , 0 , 0 ,
0 } , { "unsigned int" , "uint32_T" , 0 , 0 , sizeof ( uint32_T ) , SS_UINT32
, 0 , 0 , 0 } } ;
#ifdef HOST_CAPI_BUILD
#undef sizeof
#endif
static TARGET_CONST rtwCAPI_ElementMap rtElementMap [ ] = { { ( NULL ) , 0 ,
0 , 0 , 0 } , } ; static const rtwCAPI_DimensionMap rtDimensionMap [ ] = { {
rtwCAPI_SCALAR , 0 , 2 , 0 } , { rtwCAPI_MATRIX_COL_MAJOR , 2 , 2 , 0 } , {
rtwCAPI_MATRIX_COL_MAJOR , 4 , 2 , 1 } } ; static const uint_T
rtDimensionArray [ ] = { 1 , 1 , 1000 , 1000 , 2 , 20 } ; static const real_T
rtcapiStoredFloats [ ] = { 0.04 , 0.0 } ; static const rtwCAPI_FixPtMap
rtFixPtMap [ ] = { { ( NULL ) , ( NULL ) , rtwCAPI_FIX_RESERVED , 0 , 0 , 0 }
, } ; static const rtwCAPI_SampleTimeMap rtSampleTimeMap [ ] = { { ( const
void * ) & rtcapiStoredFloats [ 0 ] , ( const void * ) & rtcapiStoredFloats [
1 ] , 1 , 0 } } ; static rtwCAPI_ModelMappingStaticInfo mmiStatic = { {
rtBlockSignals , 16 , ( NULL ) , 0 , ( NULL ) , 0 } , { rtBlockParameters ,
12 , rtModelParameters , 8 } , { ( NULL ) , 0 } , { rtDataTypeMap ,
rtDimensionMap , rtFixPtMap , rtElementMap , rtSampleTimeMap ,
rtDimensionArray } , "float" , { 3880949861U , 2926028020U , 2609577865U ,
1771568911U } , ( NULL ) , 0 , 0 } ; const rtwCAPI_ModelMappingStaticInfo *
Simulation_CircularSensor_GetCAPIStaticMap ( void ) { return & mmiStatic ; }
#ifndef HOST_CAPI_BUILD
void Simulation_CircularSensor_InitializeDataMapInfo ( void ) {
rtwCAPI_SetVersion ( ( * rt_dataMapInfoPtr ) . mmi , 1 ) ;
rtwCAPI_SetStaticMap ( ( * rt_dataMapInfoPtr ) . mmi , & mmiStatic ) ;
rtwCAPI_SetLoggingStaticMap ( ( * rt_dataMapInfoPtr ) . mmi , ( NULL ) ) ;
rtwCAPI_SetDataAddressMap ( ( * rt_dataMapInfoPtr ) . mmi , rtDataAddrMap ) ;
rtwCAPI_SetVarDimsAddressMap ( ( * rt_dataMapInfoPtr ) . mmi ,
rtVarDimsAddrMap ) ; rtwCAPI_SetInstanceLoggingInfo ( ( * rt_dataMapInfoPtr )
. mmi , ( NULL ) ) ; rtwCAPI_SetChildMMIArray ( ( * rt_dataMapInfoPtr ) . mmi
, ( NULL ) ) ; rtwCAPI_SetChildMMIArrayLen ( ( * rt_dataMapInfoPtr ) . mmi ,
0 ) ; }
#else
#ifdef __cplusplus
extern "C" {
#endif
void Simulation_CircularSensor_host_InitializeDataMapInfo (
Simulation_CircularSensor_host_DataMapInfo_T * dataMap , const char * path )
{ rtwCAPI_SetVersion ( dataMap -> mmi , 1 ) ; rtwCAPI_SetStaticMap ( dataMap
-> mmi , & mmiStatic ) ; rtwCAPI_SetDataAddressMap ( dataMap -> mmi , NULL )
; rtwCAPI_SetVarDimsAddressMap ( dataMap -> mmi , NULL ) ; rtwCAPI_SetPath (
dataMap -> mmi , path ) ; rtwCAPI_SetFullPath ( dataMap -> mmi , NULL ) ;
rtwCAPI_SetChildMMIArray ( dataMap -> mmi , ( NULL ) ) ;
rtwCAPI_SetChildMMIArrayLen ( dataMap -> mmi , 0 ) ; }
#ifdef __cplusplus
}
#endif
#endif
