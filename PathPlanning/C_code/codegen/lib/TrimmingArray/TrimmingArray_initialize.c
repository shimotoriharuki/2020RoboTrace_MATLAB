/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: TrimmingArray_initialize.c
 *
 * MATLAB Coder version            : 5.0
 * C/C++ source code generated on  : 11-May-2020 13:35:47
 */

/* Include Files */
#include "TrimmingArray_initialize.h"
#include "TrimmingArray.h"
#include "TrimmingArray_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : void
 */
void TrimmingArray_initialize(void)
{
  rt_InitInfAndNaN();
  isInitialized_TrimmingArray = true;
}

/*
 * File trailer for TrimmingArray_initialize.c
 *
 * [EOF]
 */
