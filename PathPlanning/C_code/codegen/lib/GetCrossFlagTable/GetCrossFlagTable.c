/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: GetCrossFlagTable.c
 *
 * MATLAB Coder version            : 5.0
 * C/C++ source code generated on  : 29-May-2020 15:24:01
 */

/* Include Files */
#include "GetCrossFlagTable.h"
#include "GetCrossFlagTable_data.h"
#include "GetCrossFlagTable_emxutil.h"
#include "GetCrossFlagTable_initialize.h"
#include "median.h"
#include "rt_nonfinite.h"
#include <math.h>

/* Function Definitions */

/*
 * Arguments    : const emxArray_real_T *position
 *                double flagMargin
 *                double searchRange
 *                emxArray_real_T *flagTable
 * Return Type  : void
 */
void GetCrossFlagTable(const emxArray_real_T *position, double flagMargin,
  double searchRange, emxArray_real_T *flagTable)
{
  emxArray_real_T *storePosition;
  int i;
  int nx;
  int k;
  emxArray_boolean_T *Outlier;
  emxArray_real_T *temp;
  emxArray_real_T *y;
  emxArray_real_T *x;
  int b_i;
  unsigned int cnt;
  double diff_idx_1;
  double diff_idx_0;
  double lb;
  if (!isInitialized_GetCrossFlagTable) {
    GetCrossFlagTable_initialize();
  }

  emxInit_real_T(&storePosition, 2);
  i = storePosition->size[0] * storePosition->size[1];
  storePosition->size[0] = position->size[0];
  storePosition->size[1] = 2;
  emxEnsureCapacity_real_T(storePosition, i);
  nx = position->size[0] << 1;
  for (i = 0; i < nx; i++) {
    storePosition->data[i] = rtNaN;
  }

  i = position->size[0] - 1;
  k = flagTable->size[0] * flagTable->size[1];
  flagTable->size[0] = 1;
  flagTable->size[1] = position->size[0];
  emxEnsureCapacity_real_T(flagTable, k);
  emxInit_boolean_T(&Outlier, 2);
  emxInit_real_T(&temp, 2);
  emxInit_real_T(&y, 2);
  emxInit_real_T(&x, 2);
  for (b_i = 0; b_i <= i; b_i++) {
    storePosition->data[b_i] = position->data[b_i];
    storePosition->data[b_i + storePosition->size[0]] = position->data[b_i +
      position->size[0]];
    k = temp->size[0] * temp->size[1];
    temp->size[0] = 1;
    temp->size[1] = storePosition->size[0] << 1;
    emxEnsureCapacity_real_T(temp, k);
    nx = storePosition->size[0] << 1;
    for (k = 0; k < nx; k++) {
      temp->data[k] = rtNaN;
    }

    cnt = 1U;
    k = storePosition->size[0] - 1;
    for (nx = 0; nx <= k; nx++) {
      diff_idx_0 = storePosition->data[b_i] - storePosition->data[nx];
      diff_idx_1 = storePosition->data[b_i + storePosition->size[0]] -
        storePosition->data[nx + storePosition->size[0]];
      if (sqrt(diff_idx_0 * diff_idx_0 + diff_idx_1 * diff_idx_1) <= searchRange)
      {
        temp->data[(int)cnt - 1] = (double)nx + 1.0;
        cnt++;
      }
    }

    /*  現在の点の周囲の点を探索   */
    diff_idx_0 = median(temp);
    k = x->size[0] * x->size[1];
    x->size[0] = 1;
    x->size[1] = temp->size[1];
    emxEnsureCapacity_real_T(x, k);
    nx = temp->size[0] * temp->size[1];
    for (k = 0; k < nx; k++) {
      x->data[k] = temp->data[k] - diff_idx_0;
    }

    nx = x->size[1];
    k = y->size[0] * y->size[1];
    y->size[0] = 1;
    y->size[1] = x->size[1];
    emxEnsureCapacity_real_T(y, k);
    for (k = 0; k < nx; k++) {
      y->data[k] = fabs(x->data[k]);
    }

    diff_idx_1 = 1.4826022185056018 * median(y);
    lb = diff_idx_0 - 3.0 * diff_idx_1;
    diff_idx_0 += 3.0 * diff_idx_1;
    k = Outlier->size[0] * Outlier->size[1];
    Outlier->size[0] = 1;
    Outlier->size[1] = temp->size[1];
    emxEnsureCapacity_boolean_T(Outlier, k);
    nx = temp->size[0] * temp->size[1];
    for (k = 0; k < nx; k++) {
      diff_idx_1 = temp->data[k];
      Outlier->data[k] = ((diff_idx_1 < lb) || (diff_idx_1 > diff_idx_0));
    }

    /*  外れ値検知 */
    nx = Outlier->size[1];
    if (Outlier->size[1] == 0) {
      diff_idx_0 = 0.0;
    } else {
      diff_idx_0 = Outlier->data[0];
      for (k = 2; k <= nx; k++) {
        diff_idx_0 += (double)Outlier->data[k - 1];
      }
    }

    flagTable->data[b_i] = (diff_idx_0 >= 1.0);

    /*  交差しているかフラグ */
  }

  emxFree_real_T(&x);
  emxFree_real_T(&y);
  emxFree_real_T(&temp);
  emxFree_boolean_T(&Outlier);
  emxFree_real_T(&storePosition);

  /*  白線を拡大した分、交差フラグをある程度前後に発生させる */
  i = position->size[0] - 1;
  for (b_i = 0; b_i <= i; b_i++) {
    if (((signed char)flagTable->data[b_i] == 1) && (0 <= (int)flagMargin - 1))
    {
      diff_idx_1 = ((double)b_i + 1.0) - flagMargin;
      if (diff_idx_1 >= 1.0) {
        flagTable->data[(int)diff_idx_1 - 1] = 1.0;
      }
    }
  }
}

/*
 * File trailer for GetCrossFlagTable.c
 *
 * [EOF]
 */
