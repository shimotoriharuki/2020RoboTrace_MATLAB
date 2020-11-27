/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_TrimmingArray_api.h
 *
 * MATLAB Coder version            : 5.0
 * C/C++ source code generated on  : 11-May-2020 13:35:47
 */

#ifndef _CODER_TRIMMINGARRAY_API_H
#define _CODER_TRIMMINGARRAY_API_H

/* Include Files */
#include <stddef.h>
#include <stdlib.h>
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"

/* Type Definitions */
#ifndef struct_emxArray_real_T
#define struct_emxArray_real_T

struct emxArray_real_T
{
  real_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                 /*struct_emxArray_real_T*/

#ifndef typedef_emxArray_real_T
#define typedef_emxArray_real_T

typedef struct emxArray_real_T emxArray_real_T;

#endif                                 /*typedef_emxArray_real_T*/

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void TrimmingArray(emxArray_real_T *Data, emxArray_real_T *TrimmedData);
extern void TrimmingArray_api(const mxArray * const prhs[1], int32_T nlhs, const
  mxArray *plhs[1]);
extern void TrimmingArray_atexit(void);
extern void TrimmingArray_initialize(void);
extern void TrimmingArray_terminate(void);
extern void TrimmingArray_xil_shutdown(void);
extern void TrimmingArray_xil_terminate(void);

#endif

/*
 * File trailer for _coder_TrimmingArray_api.h
 *
 * [EOF]
 */
