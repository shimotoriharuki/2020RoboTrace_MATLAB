#include "rt_logging_mmi.h"
#include "Simulation_CircularSensor_capi.h"
#include <math.h>
#include "Simulation_CircularSensor.h"
#include "Simulation_CircularSensor_private.h"
#include "Simulation_CircularSensor_dt.h"
extern void * CreateDiagnosticAsVoidPtr_wrapper ( const char * id , int nargs
, ... ) ; RTWExtModeInfo * gblRTWExtModeInfo = NULL ; extern boolean_T
gblExtModeStartPktReceived ; void raccelForceExtModeShutdown ( ) { if ( !
gblExtModeStartPktReceived ) { boolean_T stopRequested = false ;
rtExtModeWaitForStartPkt ( gblRTWExtModeInfo , 2 , & stopRequested ) ; }
rtExtModeShutdown ( 2 ) ; }
#include "slsv_diagnostic_codegen_c_api.h"
const int_T gblNumToFiles = 0 ; const int_T gblNumFrFiles = 0 ; const int_T
gblNumFrWksBlocks = 0 ;
#ifdef RSIM_WITH_SOLVER_MULTITASKING
boolean_T gbl_raccel_isMultitasking = 1 ;
#else
boolean_T gbl_raccel_isMultitasking = 0 ;
#endif
boolean_T gbl_raccel_tid01eq = 0 ; int_T gbl_raccel_NumST = 3 ; const char_T
* gbl_raccel_Version = "9.3 (R2020a) 18-Nov-2019" ; void
raccel_setup_MMIStateLog ( SimStruct * S ) {
#ifdef UseMMIDataLogging
rt_FillStateSigInfoFromMMI ( ssGetRTWLogInfo ( S ) , & ssGetErrorStatus ( S )
) ;
#else
UNUSED_PARAMETER ( S ) ;
#endif
} static DataMapInfo rt_dataMapInfo ; DataMapInfo * rt_dataMapInfoPtr = &
rt_dataMapInfo ; rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; const char * gblSlvrJacPatternFileName =
 "slprj\\raccel\\Simulation_CircularSensor\\Simulation_CircularSensor_Jpattern.mat"
; const int_T gblNumRootInportBlks = 0 ; const int_T gblNumModelInputs = 0 ;
extern rtInportTUtable * gblInportTUtables ; extern const char *
gblInportFileName ; extern void * gblAperiodicPartitionHitTimes ; const int_T
gblInportDataTypeIdx [ ] = { - 1 } ; const int_T gblInportDims [ ] = { - 1 }
; const int_T gblInportComplex [ ] = { - 1 } ; const int_T
gblInportInterpoFlag [ ] = { - 1 } ; const int_T gblInportContinuous [ ] = {
- 1 } ; int_T enableFcnCallFlag [ ] = { 1 , 1 , 1 } ; const char *
raccelLoadInputsAndAperiodicHitTimes ( const char * inportFileName , int *
matFileFormat ) { return rt_RapidReadInportsMatFile ( inportFileName ,
matFileFormat , 1 ) ; }
#include "simstruc.h"
#include "fixedpoint.h"
#define efc5uw4kzw (2U)
#define fbdkregaiu (1U)
B rtB ; DW rtDW ; static SimStruct model_S ; SimStruct * const rtS = &
model_S ; static void pmtv0kwauq ( llaekkqjws * * pEmxArray , int32_T
numDimensions ) ; static void gp25zqqcqz ( llaekkqjws * emxArray , int32_T
oldNumel ) ; static void h2xgomwyf1 ( llaekkqjws * * pEmxArray ) ; static
void pmtv0kwauq ( llaekkqjws * * pEmxArray , int32_T numDimensions ) {
llaekkqjws * emxArray ; int32_T i ; * pEmxArray = ( llaekkqjws * ) malloc (
sizeof ( llaekkqjws ) ) ; emxArray = * pEmxArray ; emxArray -> data = (
real_T * ) NULL ; emxArray -> numDimensions = numDimensions ; emxArray ->
size = ( int32_T * ) malloc ( sizeof ( int32_T ) * numDimensions ) ; emxArray
-> allocatedSize = 0 ; emxArray -> canFreeData = true ; for ( i = 0 ; i <
numDimensions ; i ++ ) { emxArray -> size [ i ] = 0 ; } } static void
gp25zqqcqz ( llaekkqjws * emxArray , int32_T oldNumel ) { int32_T newNumel ;
int32_T i ; void * newData ; if ( oldNumel < 0 ) { oldNumel = 0 ; } newNumel
= 1 ; for ( i = 0 ; i < emxArray -> numDimensions ; i ++ ) { newNumel *=
emxArray -> size [ i ] ; } if ( newNumel > emxArray -> allocatedSize ) { i =
emxArray -> allocatedSize ; if ( i < 16 ) { i = 16 ; } while ( i < newNumel )
{ if ( i > 1073741823 ) { i = MAX_int32_T ; } else { i <<= 1 ; } } newData =
calloc ( ( uint32_T ) i , sizeof ( real_T ) ) ; if ( emxArray -> data != NULL
) { memcpy ( newData , emxArray -> data , sizeof ( real_T ) * oldNumel ) ; if
( emxArray -> canFreeData ) { free ( emxArray -> data ) ; } } emxArray ->
data = ( real_T * ) newData ; emxArray -> allocatedSize = i ; emxArray ->
canFreeData = true ; } } static void h2xgomwyf1 ( llaekkqjws * * pEmxArray )
{ if ( * pEmxArray != ( llaekkqjws * ) NULL ) { if ( ( ( * pEmxArray ) ->
data != ( real_T * ) NULL ) && ( * pEmxArray ) -> canFreeData ) { free ( ( *
pEmxArray ) -> data ) ; } free ( ( * pEmxArray ) -> size ) ; free ( *
pEmxArray ) ; * pEmxArray = ( llaekkqjws * ) NULL ; } } void MdlInitialize (
void ) { rtDW . bduzutfccm = rtP . DiscreteTimeIntegrator2_IC ; rtDW .
erly5mzpqu = rtP . DiscreteTimeIntegrator1_IC ; rtDW . hmodxnmmkt = rtP .
DiscreteTimeIntegrator_IC ; rtDW . mub0cybqzq = - 1 ; rtDW . frt1tkd2yf = 0U
; rtDW . psqpiuobuv = 0U ; } void MdlStart ( void ) { int32_T i ; { void * *
slioCatalogueAddr = rt_slioCatalogueAddr ( ) ; void * r2 = ( NULL ) ; void *
* pOSigstreamManagerAddr = ( NULL ) ; const int maxErrorBufferSize = 16384 ;
char errMsgCreatingOSigstreamManager [ 16384 ] ; bool
errorCreatingOSigstreamManager = false ; const char *
errorAddingR2SharedResource = ( NULL ) ; * slioCatalogueAddr =
rtwGetNewSlioCatalogue ( rt_GetMatSigLogSelectorFileName ( ) ) ;
errorAddingR2SharedResource = rtwAddR2SharedResource (
rtwGetPointerFromUniquePtr ( rt_slioCatalogue ( ) ) , 1 ) ; if (
errorAddingR2SharedResource != ( NULL ) ) { rtwTerminateSlioCatalogue (
slioCatalogueAddr ) ; * slioCatalogueAddr = ( NULL ) ; ssSetErrorStatus ( rtS
, errorAddingR2SharedResource ) ; return ; } r2 = rtwGetR2SharedResource (
rtwGetPointerFromUniquePtr ( rt_slioCatalogue ( ) ) ) ;
pOSigstreamManagerAddr = rt_GetOSigstreamManagerAddr ( ) ;
errorCreatingOSigstreamManager = rtwOSigstreamManagerCreateInstance (
rt_GetMatSigLogSelectorFileName ( ) , r2 , pOSigstreamManagerAddr ,
errMsgCreatingOSigstreamManager , maxErrorBufferSize ) ; if (
errorCreatingOSigstreamManager ) { * pOSigstreamManagerAddr = ( NULL ) ;
ssSetErrorStatus ( rtS , errMsgCreatingOSigstreamManager ) ; return ; } } {
bool externalInputIsInDatasetFormat = false ; void * pISigstreamManager =
rt_GetISigstreamManager ( ) ; rtwISigstreamManagerGetInputIsInDatasetFormat (
pISigstreamManager , & externalInputIsInDatasetFormat ) ; if (
externalInputIsInDatasetFormat ) { } } { int_T dimensions [ 1 ] = { 3 } ;
rtDW . af1vwlxkji . LoggedData = rt_CreateLogVar ( ssGetRTWLogInfo ( rtS ) ,
ssGetTStart ( rtS ) , ssGetTFinal ( rtS ) , 0.0 , ( & ssGetErrorStatus ( rtS
) ) , "RobotPos" , SS_DOUBLE , 0 , 0 , 0 , 3 , 1 , dimensions , NO_LOGVALDIMS
, ( NULL ) , ( NULL ) , 0 , 1 , 0.4 , 1 ) ; if ( rtDW . af1vwlxkji .
LoggedData == ( NULL ) ) return ; } { static int_T rt_ToWksWidths [ ] = { 40
} ; static int_T rt_ToWksNumDimensions [ ] = { 2 } ; static int_T
rt_ToWksDimensions [ ] = { 2 , 20 } ; static boolean_T rt_ToWksIsVarDims [ ]
= { 1 } ; static void * rt_ToWksCurrSigDims [ ] = { ( NULL ) , ( NULL ) } ;
static int_T rt_ToWksCurrSigDimsSize [ ] = { 4 , 4 } ; static BuiltInDTypeId
rt_ToWksDataTypeIds [ ] = { SS_DOUBLE } ; static int_T rt_ToWksComplexSignals
[ ] = { 0 } ; static int_T rt_ToWksFrameData [ ] = { 0 } ; static
RTWPreprocessingFcnPtr rt_ToWksLoggingPreprocessingFcnPtrs [ ] = { ( NULL ) }
; static const char_T * rt_ToWksLabels [ ] = { "" } ; static RTWLogSignalInfo
rt_ToWksSignalInfo = { 1 , rt_ToWksWidths , rt_ToWksNumDimensions ,
rt_ToWksDimensions , rt_ToWksIsVarDims , rt_ToWksCurrSigDims ,
rt_ToWksCurrSigDimsSize , rt_ToWksDataTypeIds , rt_ToWksComplexSignals ,
rt_ToWksFrameData , rt_ToWksLoggingPreprocessingFcnPtrs , { rt_ToWksLabels }
, ( NULL ) , ( NULL ) , ( NULL ) , { ( NULL ) } , { ( NULL ) } , ( NULL ) , (
NULL ) } ; static const char_T rt_ToWksBlockName [ ] =
"Simulation_CircularSensor/To Workspace2" ; rt_ToWksCurrSigDims [ 0 ] = &
rtDW . orevitufji [ 0 ] ; rt_ToWksCurrSigDims [ 1 ] = & rtDW . orevitufji [ 1
] ; rtDW . ncyke2zkxu . LoggedData = rt_CreateStructLogVar ( ssGetRTWLogInfo
( rtS ) , ssGetTStart ( rtS ) , ssGetTFinal ( rtS ) , 0.0 , ( &
ssGetErrorStatus ( rtS ) ) , "SensPos" , 0 , 0 , 1 , 0.4 , &
rt_ToWksSignalInfo , rt_ToWksBlockName ) ; if ( rtDW . ncyke2zkxu .
LoggedData == ( NULL ) ) return ; } for ( i = 0 ; i < 1000000 ; i ++ ) { rtDW
. ob2ec14xe1 [ i ] = rtP . DataStoreMemory1_InitialValue ; } rtDW .
fhpdmjxep0 = rtP . DataStoreMemory2_InitialValue ; rtDW . ksa3xgmiqj = rtP .
DataStoreMemory3_InitialValue ; rtDW . okcpqnsmiw = rtP .
DataStoreMemory4_InitialValue ; rtDW . lbb42b2aei = rtP .
DataStoreMemory5_InitialValue ; rtDW . hknj5qhj2i = rtP .
DataStoreMemory7_InitialValue ; MdlInitialize ( ) ; } void MdlOutputs ( int_T
tid ) { real_T AngleBetweenSensor ; real_T AllSensorNumer ; llaekkqjws *
InitialSensPos ; real_T CenterNumber ; real_T DeltaTh ; llaekkqjws *
RotatedSensPos ; int32_T i ; llaekkqjws * Trimming ; int32_T idx ; real_T
mk2ge3chip [ 20 ] ; int32_T loop_ub ; real_T Origin_idx_0 ; real_T
Origin_idx_1 ; real_T InitialSensPos_idx_0 ; real_T InitialSensPos_idx_1 ;
boolean_T exitg1 ; if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { rtDW . mub0cybqzq =
- 1 ; if ( rtDW . frt1tkd2yf == 0U ) { rtDW . frt1tkd2yf = 1U ; rtDW .
psqpiuobuv = fbdkregaiu ; memcpy ( & rtB . jumjq2t40g [ 0 ] , & rtP . Pixels
[ 0 ] , 1000000U * sizeof ( real_T ) ) ; rtB . pq4oqj1ftp = rtP . L ; rtB .
n1gggjnnco = rtP . SensorRadius ; rtB . pjgcsw34ma = rtP . SensorNumber ; rtB
. f5eb0air2b = rtP . SensorAngle ; rtB . mqse2qzydk = rtP . SensorRange ;
rtDW . m1qnoszbqg = 1.0 ; } else if ( rtDW . psqpiuobuv == fbdkregaiu ) {
memcpy ( & rtB . jumjq2t40g [ 0 ] , & rtP . Pixels [ 0 ] , 1000000U * sizeof
( real_T ) ) ; rtB . pq4oqj1ftp = rtP . L ; rtB . n1gggjnnco = rtP .
SensorRadius ; rtB . pjgcsw34ma = rtP . SensorNumber ; rtB . f5eb0air2b = rtP
. SensorAngle ; rtB . mqse2qzydk = rtP . SensorRange ; if ( rtDW . m1qnoszbqg
== 1.0 ) { rtDW . psqpiuobuv = efc5uw4kzw ; } } else { } memcpy ( & rtDW .
ob2ec14xe1 [ 0 ] , & rtB . jumjq2t40g [ 0 ] , 1000000U * sizeof ( real_T ) )
; pmtv0kwauq ( & InitialSensPos , 2 ) ; rtDW . fhpdmjxep0 = rtB . pq4oqj1ftp
; rtDW . ksa3xgmiqj = rtB . n1gggjnnco ; rtDW . okcpqnsmiw = rtB . pjgcsw34ma
; rtDW . lbb42b2aei = rtB . f5eb0air2b ; rtDW . hknj5qhj2i = rtB . mqse2qzydk
; rtB . hgvcypb44z = 1000.0 * rtP . scale * rtDW . bduzutfccm ; rtB .
ofuexryd5s = 1000.0 * rtP . scale * rtDW . erly5mzpqu ; rtB . lw0eucomel =
rtDW . hmodxnmmkt ; Origin_idx_0 = rtDW . fhpdmjxep0 * muDoubleScalarCos (
rtB . lw0eucomel ) + rtB . hgvcypb44z ; Origin_idx_1 = rtDW . fhpdmjxep0 *
muDoubleScalarSin ( rtB . lw0eucomel ) + rtB . ofuexryd5s ;
AngleBetweenSensor = rtDW . lbb42b2aei / rtDW . okcpqnsmiw *
0.017453292519943295 ; AllSensorNumer = rtDW . okcpqnsmiw * 2.0 + 1.0 ; i =
InitialSensPos -> size [ 0 ] * InitialSensPos -> size [ 1 ] ; InitialSensPos
-> size [ 0 ] = 2 ; InitialSensPos -> size [ 1 ] = ( int32_T ) AllSensorNumer
; gp25zqqcqz ( InitialSensPos , i ) ; loop_ub = ( ( int32_T ) AllSensorNumer
<< 1 ) - 1 ; for ( i = 0 ; i <= loop_ub ; i ++ ) { InitialSensPos -> data [ i
] = 0.0 ; } CenterNumber = muDoubleScalarCeil ( AllSensorNumer / 2.0 ) ;
loop_ub = ( int32_T ) CenterNumber - 1 ; InitialSensPos -> data [ loop_ub <<
1 ] = Origin_idx_0 + rtDW . ksa3xgmiqj ; InitialSensPos -> data [ ( loop_ub
<< 1 ) + 1 ] = Origin_idx_1 ; DeltaTh = 0.0 ; for ( i = 0 ; i < ( int32_T )
rtDW . okcpqnsmiw ; i ++ ) { DeltaTh += AngleBetweenSensor ; loop_ub = (
int32_T ) CenterNumber ; InitialSensPos_idx_0 = InitialSensPos -> data [ (
loop_ub - 1 ) << 1 ] - Origin_idx_0 ; InitialSensPos_idx_1 = InitialSensPos
-> data [ ( ( loop_ub - 1 ) << 1 ) + 1 ] - Origin_idx_1 ; loop_ub = ( int32_T
) ( ( ( real_T ) i + 1.0 ) + CenterNumber ) ; InitialSensPos -> data [ (
loop_ub - 1 ) << 1 ] = ( muDoubleScalarCos ( DeltaTh ) * InitialSensPos_idx_0
+ - muDoubleScalarSin ( DeltaTh ) * InitialSensPos_idx_1 ) + Origin_idx_0 ;
InitialSensPos -> data [ ( ( loop_ub - 1 ) << 1 ) + 1 ] = ( muDoubleScalarSin
( DeltaTh ) * InitialSensPos_idx_0 + muDoubleScalarCos ( DeltaTh ) *
InitialSensPos_idx_1 ) + Origin_idx_1 ; InitialSensPos -> data [ ( ( int32_T
) ( CenterNumber - ( ( real_T ) i + 1.0 ) ) - 1 ) << 1 ] = InitialSensPos ->
data [ ( ( int32_T ) ( ( ( real_T ) i + 1.0 ) + CenterNumber ) - 1 ) << 1 ] ;
InitialSensPos -> data [ ( ( ( int32_T ) ( CenterNumber - ( ( real_T ) i +
1.0 ) ) - 1 ) << 1 ) + 1 ] = InitialSensPos -> data [ ( ( ( int32_T )
CenterNumber - 1 ) << 1 ) + 1 ] - ( InitialSensPos -> data [ ( ( ( int32_T )
( ( ( real_T ) i + 1.0 ) + CenterNumber ) - 1 ) << 1 ) + 1 ] - InitialSensPos
-> data [ ( ( ( int32_T ) CenterNumber - 1 ) << 1 ) + 1 ] ) ; } pmtv0kwauq (
& RotatedSensPos , 2 ) ; i = RotatedSensPos -> size [ 0 ] * RotatedSensPos ->
size [ 1 ] ; RotatedSensPos -> size [ 0 ] = 2 ; RotatedSensPos -> size [ 1 ]
= ( int32_T ) AllSensorNumer ; gp25zqqcqz ( RotatedSensPos , i ) ; for (
loop_ub = 0 ; loop_ub < ( int32_T ) AllSensorNumer ; loop_ub ++ ) {
InitialSensPos_idx_0 = InitialSensPos -> data [ loop_ub << 1 ] - Origin_idx_0
; InitialSensPos_idx_1 = InitialSensPos -> data [ ( loop_ub << 1 ) + 1 ] -
Origin_idx_1 ; RotatedSensPos -> data [ loop_ub << 1 ] = ( muDoubleScalarCos
( rtB . lw0eucomel ) * InitialSensPos_idx_0 + - muDoubleScalarSin ( rtB .
lw0eucomel ) * InitialSensPos_idx_1 ) + Origin_idx_0 ; RotatedSensPos -> data
[ ( loop_ub << 1 ) + 1 ] = ( muDoubleScalarSin ( rtB . lw0eucomel ) *
InitialSensPos_idx_0 + muDoubleScalarCos ( rtB . lw0eucomel ) *
InitialSensPos_idx_1 ) + Origin_idx_1 ; } h2xgomwyf1 ( & InitialSensPos ) ;
rtDW . orevitufji [ 0 ] = RotatedSensPos -> size [ 0 ] ; rtDW . orevitufji [
1 ] = RotatedSensPos -> size [ 1 ] ; loop_ub = RotatedSensPos -> size [ 0 ] *
RotatedSensPos -> size [ 1 ] ; for ( i = 0 ; i < loop_ub ; i ++ ) { rtB .
gd1faqqhf2 [ i ] = RotatedSensPos -> data [ i ] ; } h2xgomwyf1 ( &
RotatedSensPos ) ; pmtv0kwauq ( & Trimming , 2 ) ; i = Trimming -> size [ 0 ]
* Trimming -> size [ 1 ] ; Trimming -> size [ 0 ] = ( int32_T ) rtDW .
ksa3xgmiqj ; Trimming -> size [ 1 ] = ( int32_T ) rtDW . ksa3xgmiqj ;
gp25zqqcqz ( Trimming , i ) ; loop_ub = ( int32_T ) rtDW . ksa3xgmiqj * (
int32_T ) rtDW . ksa3xgmiqj - 1 ; for ( i = 0 ; i <= loop_ub ; i ++ ) {
Trimming -> data [ i ] = 0.0 ; } AllSensorNumer = rtDW . okcpqnsmiw * 2.0 +
1.0 ; rtDW . odc1vrxcnj [ 0 ] = 1 ; rtDW . odc1vrxcnj [ 1 ] = ( int32_T )
AllSensorNumer ; loop_ub = ( int32_T ) AllSensorNumer ; if ( 0 <= loop_ub - 1
) { memset ( & mk2ge3chip [ 0 ] , 0 , loop_ub * sizeof ( real_T ) ) ; } for (
loop_ub = 0 ; loop_ub < ( int32_T ) AllSensorNumer ; loop_ub ++ ) {
AngleBetweenSensor = rtB . gd1faqqhf2 [ rtDW . orevitufji [ 0 ] * loop_ub ] ;
CenterNumber = rtB . gd1faqqhf2 [ rtDW . orevitufji [ 0 ] * loop_ub + 1 ] ;
for ( i = 0 ; i < ( int32_T ) rtDW . ksa3xgmiqj ; i ++ ) { for ( idx = 0 ;
idx < ( int32_T ) rtDW . ksa3xgmiqj ; idx ++ ) { if ( ( ( AngleBetweenSensor
- muDoubleScalarCeil ( rtDW . ksa3xgmiqj / 2.0 ) ) + ( ( real_T ) idx + 1.0 )
> 0.0 ) && ( ( muDoubleScalarCeil ( rtDW . ksa3xgmiqj / 2.0 ) +
AngleBetweenSensor ) + ( ( real_T ) idx + 1.0 ) < 1000.0 ) && ( (
CenterNumber - muDoubleScalarCeil ( rtDW . ksa3xgmiqj / 2.0 ) ) + ( ( real_T
) i + 1.0 ) > 0.0 ) && ( ( CenterNumber - muDoubleScalarCeil ( rtDW .
ksa3xgmiqj / 2.0 ) ) + ( ( real_T ) i + 1.0 ) < 1000.0 ) ) { Trimming -> data
[ i + Trimming -> size [ 0 ] * idx ] = rtDW . ob2ec14xe1 [ ( ( ( int32_T )
muDoubleScalarCeil ( ( AngleBetweenSensor - rtDW . ksa3xgmiqj / 2.0 ) + ( (
real_T ) idx + 1.0 ) ) - 1 ) * 1000 + ( int32_T ) muDoubleScalarCeil ( (
CenterNumber - rtDW . ksa3xgmiqj / 2.0 ) + ( ( real_T ) i + 1.0 ) ) ) - 1 ] ;
} else { Trimming -> data [ i + Trimming -> size [ 0 ] * idx ] = ( rtNaN ) ;
} } } if ( ( Trimming -> size [ 0 ] * Trimming -> size [ 1 ] == 0 ) || (
Trimming -> size [ 0 ] * Trimming -> size [ 1 ] == 0 ) ) { AngleBetweenSensor
= 0.0 ; } else { AngleBetweenSensor = Trimming -> data [ 0 ] ; for ( i = 2 ;
i <= Trimming -> size [ 0 ] * Trimming -> size [ 1 ] ; i ++ ) {
AngleBetweenSensor += Trimming -> data [ i - 1 ] ; } } mk2ge3chip [ loop_ub ]
= AngleBetweenSensor / ( real_T ) ( Trimming -> size [ 0 ] * Trimming -> size
[ 1 ] ) ; } h2xgomwyf1 ( & Trimming ) ; AngleBetweenSensor = rtDW .
lbb42b2aei / rtDW . okcpqnsmiw * 0.017453292519943295 ; AllSensorNumer = rtDW
. okcpqnsmiw * 2.0 + 1.0 ; if ( rtDW . odc1vrxcnj [ 1 ] <= 2 ) { if ( rtDW .
odc1vrxcnj [ 1 ] == 1 ) { idx = 0 ; } else if ( ( mk2ge3chip [ 0 ] <
mk2ge3chip [ 1 ] ) || ( muDoubleScalarIsNaN ( mk2ge3chip [ 0 ] ) && ( !
muDoubleScalarIsNaN ( mk2ge3chip [ 1 ] ) ) ) ) { idx = 1 ; } else { idx = 0 ;
} } else { if ( ! muDoubleScalarIsNaN ( mk2ge3chip [ 0 ] ) ) { idx = 0 ; }
else { idx = - 1 ; loop_ub = 2 ; exitg1 = false ; while ( ( ! exitg1 ) && (
loop_ub <= rtDW . odc1vrxcnj [ 1 ] ) ) { if ( ! muDoubleScalarIsNaN (
mk2ge3chip [ loop_ub - 1 ] ) ) { idx = loop_ub - 1 ; exitg1 = true ; } else {
loop_ub ++ ; } } } if ( idx + 1 == 0 ) { idx = 0 ; } else { CenterNumber =
mk2ge3chip [ idx ] ; for ( i = idx + 1 ; i < rtDW . odc1vrxcnj [ 1 ] ; i ++ )
{ if ( CenterNumber < mk2ge3chip [ i ] ) { CenterNumber = mk2ge3chip [ i ] ;
idx = i ; } } } } if ( idx + 1 == 1 ) { Origin_idx_0 = 0.0 ; Origin_idx_1 =
mk2ge3chip [ 1 ] / mk2ge3chip [ 0 ] ; } else if ( idx + 1 == AllSensorNumer )
{ Origin_idx_0 = mk2ge3chip [ idx - 1 ] / mk2ge3chip [ idx ] ; Origin_idx_1 =
0.0 ; } else { Origin_idx_0 = mk2ge3chip [ idx - 1 ] / mk2ge3chip [ idx ] ;
Origin_idx_1 = mk2ge3chip [ idx + 1 ] / mk2ge3chip [ idx ] ; } rtB .
koeh140u5g = ( muDoubleScalarCeil ( AllSensorNumer / 2.0 ) - ( real_T ) ( idx
+ 1 ) ) * AngleBetweenSensor + AngleBetweenSensor / 2.0 * ( Origin_idx_0 -
Origin_idx_1 ) ; if ( rtB . koeh140u5g != 0.0 ) { AllSensorNumer = rtDW .
fhpdmjxep0 / muDoubleScalarTan ( rtB . koeh140u5g ) ; } else { AllSensorNumer
= 9.0E+10 ; } rtB . eglqpzmyql = - rtP . Tvelo / ( AllSensorNumer * 0.001 ) ;
rtB . jvxitaw4eg [ 0 ] = rtB . hgvcypb44z ; rtB . jvxitaw4eg [ 1 ] = rtB .
ofuexryd5s ; rtB . jvxitaw4eg [ 2 ] = rtB . lw0eucomel ; if ( ssGetLogOutput
( rtS ) ) { { double locTime = ssGetTaskTime ( rtS , 1 ) ; ; if (
rtwTimeInLoggingInterval ( rtliGetLoggingInterval ( ssGetRootSS ( rtS ) ->
mdlInfo -> rtwLogInfo ) , locTime ) ) { rt_UpdateLogVar ( ( LogVar * ) (
LogVar * ) ( rtDW . af1vwlxkji . LoggedData ) , & rtB . jvxitaw4eg [ 0 ] , 0
) ; } } } if ( ssGetLogOutput ( rtS ) ) { { double locTime = ssGetTaskTime (
rtS , 1 ) ; ; if ( rtwTimeInLoggingInterval ( rtliGetLoggingInterval (
ssGetRootSS ( rtS ) -> mdlInfo -> rtwLogInfo ) , locTime ) ) {
rt_UpdateStructLogVar ( ( StructLogVar * ) rtDW . ncyke2zkxu . LoggedData , (
NULL ) , & rtB . gd1faqqhf2 [ 0 ] ) ; } } } rtB . i5igcfvlny = rtP . Tvelo *
muDoubleScalarSin ( rtB . lw0eucomel ) ; rtB . ddiciehpze = rtP . Tvelo *
muDoubleScalarCos ( rtB . lw0eucomel ) ; } UNUSED_PARAMETER ( tid ) ; } void
MdlUpdate ( int_T tid ) { if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { rtDW .
bduzutfccm += rtP . DiscreteTimeIntegrator2_gainval * rtB . ddiciehpze ; rtDW
. erly5mzpqu += rtP . DiscreteTimeIntegrator1_gainval * rtB . i5igcfvlny ;
rtDW . hmodxnmmkt += rtP . DiscreteTimeIntegrator_gainval * rtB . eglqpzmyql
; } UNUSED_PARAMETER ( tid ) ; } void MdlUpdateTID2 ( int_T tid ) {
UNUSED_PARAMETER ( tid ) ; } void MdlTerminate ( void ) { if (
rt_slioCatalogue ( ) != ( NULL ) ) { void * * slioCatalogueAddr =
rt_slioCatalogueAddr ( ) ; rtwSaveDatasetsToMatFile (
rtwGetPointerFromUniquePtr ( rt_slioCatalogue ( ) ) ,
rt_GetMatSigstreamLoggingFileName ( ) ) ; rtwTerminateSlioCatalogue (
slioCatalogueAddr ) ; * slioCatalogueAddr = NULL ; } } void
MdlInitializeSizes ( void ) { ssSetNumContStates ( rtS , 0 ) ; ssSetNumY (
rtS , 0 ) ; ssSetNumU ( rtS , 0 ) ; ssSetDirectFeedThrough ( rtS , 0 ) ;
ssSetNumSampleTimes ( rtS , 2 ) ; ssSetNumBlocks ( rtS , 38 ) ;
ssSetNumBlockIO ( rtS , 15 ) ; ssSetNumBlockParams ( rtS , 1000019 ) ; } void
MdlInitializeSampleTimes ( void ) { ssSetSampleTime ( rtS , 0 , 0.0 ) ;
ssSetSampleTime ( rtS , 1 , 0.4 ) ; ssSetOffsetTime ( rtS , 0 , 1.0 ) ;
ssSetOffsetTime ( rtS , 1 , 0.0 ) ; } void raccel_set_checksum ( ) {
ssSetChecksumVal ( rtS , 0 , 776680629U ) ; ssSetChecksumVal ( rtS , 1 ,
1304470307U ) ; ssSetChecksumVal ( rtS , 2 , 2417145415U ) ; ssSetChecksumVal
( rtS , 3 , 4200155072U ) ; }
#if defined(_MSC_VER)
#pragma optimize( "", off )
#endif
SimStruct * raccel_register_model ( void ) { static struct _ssMdlInfo mdlInfo
; ( void ) memset ( ( char * ) rtS , 0 , sizeof ( SimStruct ) ) ; ( void )
memset ( ( char * ) & mdlInfo , 0 , sizeof ( struct _ssMdlInfo ) ) ;
ssSetMdlInfoPtr ( rtS , & mdlInfo ) ; { static time_T mdlPeriod [
NSAMPLE_TIMES ] ; static time_T mdlOffset [ NSAMPLE_TIMES ] ; static time_T
mdlTaskTimes [ NSAMPLE_TIMES ] ; static int_T mdlTsMap [ NSAMPLE_TIMES ] ;
static int_T mdlSampleHits [ NSAMPLE_TIMES ] ; static boolean_T
mdlTNextWasAdjustedPtr [ NSAMPLE_TIMES ] ; static int_T mdlPerTaskSampleHits
[ NSAMPLE_TIMES * NSAMPLE_TIMES ] ; static time_T mdlTimeOfNextSampleHit [
NSAMPLE_TIMES ] ; { int_T i ; for ( i = 0 ; i < NSAMPLE_TIMES ; i ++ ) {
mdlPeriod [ i ] = 0.0 ; mdlOffset [ i ] = 0.0 ; mdlTaskTimes [ i ] = 0.0 ;
mdlTsMap [ i ] = i ; mdlSampleHits [ i ] = 1 ; } } ssSetSampleTimePtr ( rtS ,
& mdlPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rtS , & mdlOffset [ 0 ] ) ;
ssSetSampleTimeTaskIDPtr ( rtS , & mdlTsMap [ 0 ] ) ; ssSetTPtr ( rtS , &
mdlTaskTimes [ 0 ] ) ; ssSetSampleHitPtr ( rtS , & mdlSampleHits [ 0 ] ) ;
ssSetTNextWasAdjustedPtr ( rtS , & mdlTNextWasAdjustedPtr [ 0 ] ) ;
ssSetPerTaskSampleHitsPtr ( rtS , & mdlPerTaskSampleHits [ 0 ] ) ;
ssSetTimeOfNextSampleHitPtr ( rtS , & mdlTimeOfNextSampleHit [ 0 ] ) ; }
ssSetSolverMode ( rtS , SOLVER_MODE_SINGLETASKING ) ; { ssSetBlockIO ( rtS ,
( ( void * ) & rtB ) ) ; ( void ) memset ( ( ( void * ) & rtB ) , 0 , sizeof
( B ) ) ; } { void * dwork = ( void * ) & rtDW ; ssSetRootDWork ( rtS , dwork
) ; ( void ) memset ( dwork , 0 , sizeof ( DW ) ) ; } { static
DataTypeTransInfo dtInfo ; ( void ) memset ( ( char_T * ) & dtInfo , 0 ,
sizeof ( dtInfo ) ) ; ssSetModelMappingInfo ( rtS , & dtInfo ) ; dtInfo .
numDataTypes = 14 ; dtInfo . dataTypeSizes = & rtDataTypeSizes [ 0 ] ; dtInfo
. dataTypeNames = & rtDataTypeNames [ 0 ] ; dtInfo . BTransTable = &
rtBTransTable ; dtInfo . PTransTable = & rtPTransTable ; dtInfo .
dataTypeInfoTable = rtDataTypeInfoTable ; }
Simulation_CircularSensor_InitializeDataMapInfo ( ) ;
ssSetIsRapidAcceleratorActive ( rtS , true ) ; ssSetRootSS ( rtS , rtS ) ;
ssSetVersion ( rtS , SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS ,
"Simulation_CircularSensor" ) ; ssSetPath ( rtS , "Simulation_CircularSensor"
) ; ssSetTStart ( rtS , 0.0 ) ; ssSetTFinal ( rtS , 20.0 ) ; { static
RTWLogInfo rt_DataLoggingInfo ; rt_DataLoggingInfo . loggingInterval = NULL ;
ssSetRTWLogInfo ( rtS , & rt_DataLoggingInfo ) ; } { { static int_T
rt_LoggedStateWidths [ ] = { 1 , 1 , 1 } ; static int_T
rt_LoggedStateNumDimensions [ ] = { 1 , 1 , 1 } ; static int_T
rt_LoggedStateDimensions [ ] = { 1 , 1 , 1 } ; static boolean_T
rt_LoggedStateIsVarDims [ ] = { 0 , 0 , 0 } ; static BuiltInDTypeId
rt_LoggedStateDataTypeIds [ ] = { SS_DOUBLE , SS_DOUBLE , SS_DOUBLE } ;
static int_T rt_LoggedStateComplexSignals [ ] = { 0 , 0 , 0 } ; static
RTWPreprocessingFcnPtr rt_LoggingStatePreprocessingFcnPtrs [ ] = { ( NULL ) ,
( NULL ) , ( NULL ) } ; static const char_T * rt_LoggedStateLabels [ ] = {
"DSTATE" , "DSTATE" , "DSTATE" } ; static const char_T *
rt_LoggedStateBlockNames [ ] = {
"Simulation_CircularSensor/Discrete-Time\nIntegrator2" ,
"Simulation_CircularSensor/Discrete-Time\nIntegrator1" ,
"Simulation_CircularSensor/Discrete-Time\nIntegrator" } ; static const char_T
* rt_LoggedStateNames [ ] = { "DSTATE" , "DSTATE" , "DSTATE" } ; static
boolean_T rt_LoggedStateCrossMdlRef [ ] = { 0 , 0 , 0 } ; static
RTWLogDataTypeConvert rt_RTWLogDataTypeConvert [ ] = { { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0
, 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } } ; static RTWLogSignalInfo rt_LoggedStateSignalInfo = { 3 ,
rt_LoggedStateWidths , rt_LoggedStateNumDimensions , rt_LoggedStateDimensions
, rt_LoggedStateIsVarDims , ( NULL ) , ( NULL ) , rt_LoggedStateDataTypeIds ,
rt_LoggedStateComplexSignals , ( NULL ) , rt_LoggingStatePreprocessingFcnPtrs
, { rt_LoggedStateLabels } , ( NULL ) , ( NULL ) , ( NULL ) , {
rt_LoggedStateBlockNames } , { rt_LoggedStateNames } ,
rt_LoggedStateCrossMdlRef , rt_RTWLogDataTypeConvert } ; static void *
rt_LoggedStateSignalPtrs [ 3 ] ; rtliSetLogXSignalPtrs ( ssGetRTWLogInfo (
rtS ) , ( LogSignalPtrsType ) rt_LoggedStateSignalPtrs ) ;
rtliSetLogXSignalInfo ( ssGetRTWLogInfo ( rtS ) , & rt_LoggedStateSignalInfo
) ; rt_LoggedStateSignalPtrs [ 0 ] = ( void * ) & rtDW . bduzutfccm ;
rt_LoggedStateSignalPtrs [ 1 ] = ( void * ) & rtDW . erly5mzpqu ;
rt_LoggedStateSignalPtrs [ 2 ] = ( void * ) & rtDW . hmodxnmmkt ; }
rtliSetLogT ( ssGetRTWLogInfo ( rtS ) , "tout" ) ; rtliSetLogX (
ssGetRTWLogInfo ( rtS ) , "" ) ; rtliSetLogXFinal ( ssGetRTWLogInfo ( rtS ) ,
"" ) ; rtliSetLogVarNameModifier ( ssGetRTWLogInfo ( rtS ) , "none" ) ;
rtliSetLogFormat ( ssGetRTWLogInfo ( rtS ) , 4 ) ; rtliSetLogMaxRows (
ssGetRTWLogInfo ( rtS ) , 0 ) ; rtliSetLogDecimation ( ssGetRTWLogInfo ( rtS
) , 1 ) ; rtliSetLogY ( ssGetRTWLogInfo ( rtS ) , "" ) ;
rtliSetLogYSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogYSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; } { static
ssSolverInfo slvrInfo ; ssSetStepSize ( rtS , 0.4 ) ; ssSetMinStepSize ( rtS
, 0.0 ) ; ssSetMaxNumMinSteps ( rtS , - 1 ) ; ssSetMinStepViolatedError ( rtS
, 0 ) ; ssSetMaxStepSize ( rtS , 0.4 ) ; ssSetSolverMaxOrder ( rtS , - 1 ) ;
ssSetSolverRefineFactor ( rtS , 1 ) ; ssSetOutputTimes ( rtS , ( NULL ) ) ;
ssSetNumOutputTimes ( rtS , 0 ) ; ssSetOutputTimesOnly ( rtS , 0 ) ;
ssSetOutputTimesIndex ( rtS , 0 ) ; ssSetZCCacheNeedsReset ( rtS , 0 ) ;
ssSetDerivCacheNeedsReset ( rtS , 0 ) ; ssSetNumNonContDerivSigInfos ( rtS ,
0 ) ; ssSetNonContDerivSigInfos ( rtS , ( NULL ) ) ; ssSetSolverInfo ( rtS ,
& slvrInfo ) ; ssSetSolverName ( rtS , "VariableStepDiscrete" ) ;
ssSetVariableStepSolver ( rtS , 1 ) ; ssSetSolverConsistencyChecking ( rtS ,
0 ) ; ssSetSolverAdaptiveZcDetection ( rtS , 0 ) ;
ssSetSolverRobustResetMethod ( rtS , 0 ) ; ssSetSolverStateProjection ( rtS ,
0 ) ; ssSetSolverMassMatrixType ( rtS , ( ssMatrixType ) 0 ) ;
ssSetSolverMassMatrixNzMax ( rtS , 0 ) ; ssSetModelOutputs ( rtS , MdlOutputs
) ; ssSetModelLogData ( rtS , rt_UpdateTXYLogVars ) ;
ssSetModelLogDataIfInInterval ( rtS , rt_UpdateTXXFYLogVars ) ;
ssSetModelUpdate ( rtS , MdlUpdate ) ; ssSetTNextTid ( rtS , INT_MIN ) ;
ssSetTNext ( rtS , rtMinusInf ) ; ssSetSolverNeedsReset ( rtS ) ;
ssSetNumNonsampledZCs ( rtS , 0 ) ; } ssSetChecksumVal ( rtS , 0 , 776680629U
) ; ssSetChecksumVal ( rtS , 1 , 1304470307U ) ; ssSetChecksumVal ( rtS , 2 ,
2417145415U ) ; ssSetChecksumVal ( rtS , 3 , 4200155072U ) ; { static const
sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE ; static RTWExtModeInfo
rt_ExtModeInfo ; static const sysRanDType * systemRan [ 6 ] ;
gblRTWExtModeInfo = & rt_ExtModeInfo ; ssSetRTWExtModeInfo ( rtS , &
rt_ExtModeInfo ) ; rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo ,
systemRan ) ; systemRan [ 0 ] = & rtAlwaysEnabled ; systemRan [ 1 ] = &
rtAlwaysEnabled ; systemRan [ 2 ] = & rtAlwaysEnabled ; systemRan [ 3 ] = &
rtAlwaysEnabled ; systemRan [ 4 ] = & rtAlwaysEnabled ; systemRan [ 5 ] = &
rtAlwaysEnabled ; rteiSetModelMappingInfoPtr ( ssGetRTWExtModeInfo ( rtS ) ,
& ssGetModelMappingInfo ( rtS ) ) ; rteiSetChecksumsPtr ( ssGetRTWExtModeInfo
( rtS ) , ssGetChecksums ( rtS ) ) ; rteiSetTPtr ( ssGetRTWExtModeInfo ( rtS
) , ssGetTPtr ( rtS ) ) ; } return rtS ; }
#if defined(_MSC_VER)
#pragma optimize( "", on )
#endif
const int_T gblParameterTuningTid = 2 ; void MdlOutputsParameterSampleTime (
int_T tid ) { UNUSED_PARAMETER ( tid ) ; }
