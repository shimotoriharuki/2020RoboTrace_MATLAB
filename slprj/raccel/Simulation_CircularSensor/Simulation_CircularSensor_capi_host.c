#include "Simulation_CircularSensor_capi_host.h"
static Simulation_CircularSensor_host_DataMapInfo_T root;
static int initialized = 0;
__declspec( dllexport ) rtwCAPI_ModelMappingInfo *getRootMappingInfo()
{
    if (initialized == 0) {
        initialized = 1;
        Simulation_CircularSensor_host_InitializeDataMapInfo(&(root), "Simulation_CircularSensor");
    }
    return &root.mmi;
}

rtwCAPI_ModelMappingInfo *mexFunction() {return(getRootMappingInfo());}
