/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: main.c
 *
 * MATLAB Coder version            : 5.0
 * C/C++ source code generated on  : 11-May-2020 13:35:47
 */

/*************************************************************************/
/* This automatically generated example C main file shows how to call    */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/

/* Include Files */
#include "main.h"
#include "TrimmingArray.h"
#include "TrimmingArray_emxAPI.h"
#include "TrimmingArray_terminate.h"
#include "rt_nonfinite.h"

/* Function Declarations */
static emxArray_real_T *argInit_Unboundedx2_real_T(void);
static double argInit_real_T(void);
static void main_TrimmingArray(void);

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : emxArray_real_T *
 */
static emxArray_real_T *argInit_Unboundedx2_real_T(void)
{
  emxArray_real_T *result;
  int idx0;
  double result_tmp;

  /* Set the size of the array.
     Change this size to the value that the application requires. */
  result = emxCreate_real_T(2, 2);

  /* Loop over the array to initialize each element. */
  for (idx0 = 0; idx0 < result->size[0U]; idx0++) {
    /* Set the value of the array element.
       Change this value to the value that the application requires. */
    result_tmp = argInit_real_T();
    result->data[idx0] = result_tmp;

    /* Set the value of the array element.
       Change this value to the value that the application requires. */
    result->data[idx0 + result->size[0]] = result_tmp;
  }

  return result;
}

/*
 * Arguments    : void
 * Return Type  : double
 */
static double argInit_real_T(void)
{
  return 0.0;
}

/*
 * Arguments    : void
 * Return Type  : void
 */
static void main_TrimmingArray(void)
{
  emxArray_real_T *TrimmedData;
  emxArray_real_T *Data;
  emxInitArray_real_T(&TrimmedData, 2);

  /* Initialize function 'TrimmingArray' input arguments. */
  /* Initialize function input argument 'Data'. */
  Data = argInit_Unboundedx2_real_T();

  /* Call the entry-point 'TrimmingArray'. */
  TrimmingArray(Data, TrimmedData);
  emxDestroyArray_real_T(TrimmedData);
  emxDestroyArray_real_T(Data);
}

/*
 * Arguments    : int argc
 *                const char * const argv[]
 * Return Type  : int
 */
int main(int argc, const char * const argv[])
{
  (void)argc;
  (void)argv;

  /* The initialize function is being called automatically from your entry-point function. So, a call to initialize is not included here. */
  /* Invoke the entry-point functions.
     You can call entry-point functions multiple times. */
  main_TrimmingArray();

  /* Terminate the application.
     You do not need to do this more than one time. */
  TrimmingArray_terminate();
  return 0;
}

/*
 * File trailer for main.c
 *
 * [EOF]
 */
