/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_GetSelfLocation_api.h
 *
 * MATLAB Coder version            : 4.2
 * C/C++ source code generated on  : 24-Mar-2020 17:34:25
 */

#ifndef _CODER_GETSELFLOCATION_API_H
#define _CODER_GETSELFLOCATION_API_H

/* Include Files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_GetSelfLocation_api.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void GetSelfLocation(real_T PrePosition[3], real_T PrePt[9], real_T PreZt,
  real_T velo[2], real_T HatPosition[3], real_T EstPosition[3], real_T EstPt[9],
  real_T *ObsZt);
extern void GetSelfLocation_api(const mxArray * const prhs[5], int32_T nlhs,
  const mxArray *plhs[3]);
extern void GetSelfLocation_atexit(void);
extern void GetSelfLocation_initialize(void);
extern void GetSelfLocation_terminate(void);
extern void GetSelfLocation_xil_shutdown(void);
extern void GetSelfLocation_xil_terminate(void);
extern void MEXGlobalSyncInFunction(const emlrtStack *sp);
extern void MEXGlobalSyncOutFunction(boolean_T skipDirtyCheck);

#endif

/*
 * File trailer for _coder_GetSelfLocation_api.h
 *
 * [EOF]
 */
