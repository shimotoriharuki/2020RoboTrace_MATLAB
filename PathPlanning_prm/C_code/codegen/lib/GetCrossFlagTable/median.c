/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: median.c
 *
 * MATLAB Coder version            : 5.0
 * C/C++ source code generated on  : 29-May-2020 15:24:01
 */

/* Include Files */
#include "median.h"
#include "GetCrossFlagTable.h"
#include "GetCrossFlagTable_emxutil.h"
#include "quickselect.h"
#include "rt_nonfinite.h"

/* Function Definitions */

/*
 * Arguments    : const emxArray_real_T *x
 * Return Type  : double
 */
double median(const emxArray_real_T *x)
{
  double y;
  int vlen;
  emxArray_real_T *b_x;
  int b_vlen;
  int loop_ub;
  int midm1;
  double b;
  vlen = x->size[1];
  if (x->size[1] == 0) {
    y = rtNaN;
  } else {
    emxInit_real_T(&b_x, 2);
    b_vlen = b_x->size[0] * b_x->size[1];
    b_x->size[0] = 1;
    b_x->size[1] = x->size[1];
    emxEnsureCapacity_real_T(b_x, b_vlen);
    loop_ub = x->size[0] * x->size[1];
    for (b_vlen = 0; b_vlen < loop_ub; b_vlen++) {
      b_x->data[b_vlen] = x->data[b_vlen];
    }

    b_vlen = 0;
    for (loop_ub = 0; loop_ub < vlen; loop_ub++) {
      if (!rtIsNaN(b_x->data[loop_ub])) {
        b_vlen++;
        if (b_vlen < loop_ub + 1) {
          b_x->data[b_vlen - 1] = b_x->data[loop_ub];
        }
      }
    }

    if (b_vlen <= 4) {
      if (b_vlen == 0) {
        y = rtNaN;
      } else if (b_vlen == 1) {
        y = b_x->data[0];
      } else if (b_vlen == 2) {
        y = b_x->data[0] + (b_x->data[1] - b_x->data[0]) / 2.0;
      } else if (b_vlen == 3) {
        if (b_x->data[0] < b_x->data[1]) {
          if (b_x->data[1] < b_x->data[2]) {
            vlen = 1;
          } else if (b_x->data[0] < b_x->data[2]) {
            vlen = 2;
          } else {
            vlen = 0;
          }
        } else if (b_x->data[0] < b_x->data[2]) {
          vlen = 0;
        } else if (b_x->data[1] < b_x->data[2]) {
          vlen = 2;
        } else {
          vlen = 1;
        }

        y = b_x->data[vlen];
      } else {
        if (b_x->data[0] < b_x->data[1]) {
          if (b_x->data[1] < b_x->data[2]) {
            loop_ub = 0;
            vlen = 1;
            b_vlen = 2;
          } else if (b_x->data[0] < b_x->data[2]) {
            loop_ub = 0;
            vlen = 2;
            b_vlen = 1;
          } else {
            loop_ub = 2;
            vlen = 0;
            b_vlen = 1;
          }
        } else if (b_x->data[0] < b_x->data[2]) {
          loop_ub = 1;
          vlen = 0;
          b_vlen = 2;
        } else if (b_x->data[1] < b_x->data[2]) {
          loop_ub = 1;
          vlen = 2;
          b_vlen = 0;
        } else {
          loop_ub = 2;
          vlen = 1;
          b_vlen = 0;
        }

        if (b_x->data[loop_ub] < b_x->data[3]) {
          if (b_x->data[3] < b_x->data[b_vlen]) {
            y = b_x->data[vlen] + (b_x->data[3] - b_x->data[vlen]) / 2.0;
          } else {
            y = b_x->data[vlen] + (b_x->data[b_vlen] - b_x->data[vlen]) / 2.0;
          }
        } else {
          y = b_x->data[loop_ub] + (b_x->data[vlen] - b_x->data[loop_ub]) / 2.0;
        }
      }
    } else {
      midm1 = b_vlen >> 1;
      if ((b_vlen & 1) == 0) {
        quickselect(b_x, midm1 + 1, b_vlen, &y, &loop_ub, &vlen);
        if (midm1 < loop_ub) {
          quickselect(b_x, midm1, vlen - 1, &b, &loop_ub, &b_vlen);
          y += (b - y) / 2.0;
        }
      } else {
        quickselect(b_x, midm1 + 1, b_vlen, &y, &loop_ub, &vlen);
      }
    }

    emxFree_real_T(&b_x);
  }

  return y;
}

/*
 * File trailer for median.c
 *
 * [EOF]
 */
