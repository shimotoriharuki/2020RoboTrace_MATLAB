/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: TrimmingArray.c
 *
 * MATLAB Coder version            : 5.0
 * C/C++ source code generated on  : 11-May-2020 13:35:47
 */

/* Include Files */
#include "TrimmingArray.h"
#include "TrimmingArray_data.h"
#include "TrimmingArray_emxutil.h"
#include "TrimmingArray_initialize.h"
#include "rt_nonfinite.h"

/* Function Definitions */

/*
 * Arguments    : const emxArray_real_T *Data
 *                emxArray_real_T *TrimmedData
 * Return Type  : void
 */
void TrimmingArray(const emxArray_real_T *Data, emxArray_real_T *TrimmedData)
{
  emxArray_boolean_T *missLoc;
  int i;
  int vstride;
  emxArray_int32_T *nz;
  emxArray_boolean_T *tf;
  int j;
  emxArray_int32_T *r;
  if (!isInitialized_TrimmingArray) {
    TrimmingArray_initialize();
  }

  emxInit_boolean_T(&missLoc, 2);
  i = missLoc->size[0] * missLoc->size[1];
  missLoc->size[0] = Data->size[0];
  missLoc->size[1] = 2;
  emxEnsureCapacity_boolean_T(missLoc, i);
  vstride = Data->size[0] * Data->size[1];
  for (i = 0; i < vstride; i++) {
    missLoc->data[i] = rtIsNaN(Data->data[i]);
  }

  emxInit_int32_T(&nz, 1);
  if (missLoc->size[0] == 0) {
    nz->size[0] = 0;
  } else {
    vstride = missLoc->size[0];
    i = nz->size[0];
    nz->size[0] = missLoc->size[0];
    emxEnsureCapacity_int32_T(nz, i);
    for (j = 0; j < vstride; j++) {
      nz->data[j] = missLoc->data[j];
      nz->data[j] += missLoc->data[vstride + j];
    }
  }

  emxFree_boolean_T(&missLoc);
  emxInit_boolean_T(&tf, 1);
  i = tf->size[0];
  tf->size[0] = nz->size[0];
  emxEnsureCapacity_boolean_T(tf, i);
  vstride = nz->size[0];
  for (i = 0; i < vstride; i++) {
    tf->data[i] = (nz->data[i] >= 1);
  }

  emxFree_int32_T(&nz);
  j = tf->size[0] - 1;
  vstride = 0;
  for (i = 0; i <= j; i++) {
    if (!tf->data[i]) {
      vstride++;
    }
  }

  emxInit_int32_T(&r, 1);
  i = r->size[0];
  r->size[0] = vstride;
  emxEnsureCapacity_int32_T(r, i);
  vstride = 0;
  for (i = 0; i <= j; i++) {
    if (!tf->data[i]) {
      r->data[vstride] = i + 1;
      vstride++;
    }
  }

  emxFree_boolean_T(&tf);
  i = TrimmedData->size[0] * TrimmedData->size[1];
  TrimmedData->size[0] = r->size[0];
  TrimmedData->size[1] = 2;
  emxEnsureCapacity_real_T(TrimmedData, i);
  vstride = r->size[0];
  for (i = 0; i < vstride; i++) {
    TrimmedData->data[i] = Data->data[r->data[i] - 1];
  }

  for (i = 0; i < vstride; i++) {
    TrimmedData->data[i + TrimmedData->size[0]] = Data->data[(r->data[i] +
      Data->size[0]) - 1];
  }

  emxFree_int32_T(&r);

  /* NuNÇçÌèú */
}

/*
 * File trailer for TrimmingArray.c
 *
 * [EOF]
 */
