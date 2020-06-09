/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: GetCrossFlagTable_initialize.c
 *
 * MATLAB Coder version            : 5.0
 * C/C++ source code generated on  : 29-May-2020 15:24:01
 */

/* Include Files */
#include "GetCrossFlagTable_initialize.h"
#include "GetCrossFlagTable.h"
#include "GetCrossFlagTable_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : void
 */
void GetCrossFlagTable_initialize(void)
{
  rt_InitInfAndNaN();
  isInitialized_GetCrossFlagTable = true;
}

/*
 * File trailer for GetCrossFlagTable_initialize.c
 *
 * [EOF]
 */
