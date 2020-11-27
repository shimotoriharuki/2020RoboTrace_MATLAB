/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: main.c
 *
 * MATLAB Coder version            : 4.2
 * C/C++ source code generated on  : 24-Mar-2020 17:34:25
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
#include "rt_nonfinite.h"
#include "GetSelfLocation.h"
#include "main.h"
#include "GetSelfLocation_terminate.h"
#include "GetSelfLocation_initialize.h"

/* Function Declarations */
static void argInit_1x2_real_T(double result[2]);
static void argInit_3x1_real_T(double result[3]);
static void argInit_3x3_real_T(double result[9]);
static double argInit_real_T(void);
static void main_GetSelfLocation(void);

/* Function Definitions */

/*
 * Arguments    : double result[2]
 * Return Type  : void
 */
static void argInit_1x2_real_T(double result[2])
{
  double result_tmp;

  /* Loop over the array to initialize each element. */
  /* Set the value of the array element.
     Change this value to the value that the application requires. */
  result_tmp = argInit_real_T();
  result[0] = result_tmp;

  /* Set the value of the array element.
     Change this value to the value that the application requires. */
  result[1] = result_tmp;
}

/*
 * Arguments    : double result[3]
 * Return Type  : void
 */
static void argInit_3x1_real_T(double result[3])
{
  double result_tmp;

  /* Loop over the array to initialize each element. */
  /* Set the value of the array element.
     Change this value to the value that the application requires. */
  result_tmp = argInit_real_T();
  result[0] = result_tmp;

  /* Set the value of the array element.
     Change this value to the value that the application requires. */
  result[1] = result_tmp;

  /* Set the value of the array element.
     Change this value to the value that the application requires. */
  result[2] = argInit_real_T();
}

/*
 * Arguments    : double result[9]
 * Return Type  : void
 */
static void argInit_3x3_real_T(double result[9])
{
  int idx0;
  double result_tmp;

  /* Loop over the array to initialize each element. */
  for (idx0 = 0; idx0 < 3; idx0++) {
    /* Set the value of the array element.
       Change this value to the value that the application requires. */
    result_tmp = argInit_real_T();
    result[idx0] = result_tmp;

    /* Set the value of the array element.
       Change this value to the value that the application requires. */
    result[idx0 + 3] = result_tmp;

    /* Set the value of the array element.
       Change this value to the value that the application requires. */
    result[idx0 + 6] = argInit_real_T();
  }
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
static void main_GetSelfLocation(void)
{
  double dv1[3];
  double dv2[9];
  double dv3[2];
  double dv4[3];
  double EstPosition[3];
  double EstPt[9];
  double ObsZt;

  /* Initialize function 'GetSelfLocation' input arguments. */
  /* Initialize function input argument 'PrePosition'. */
  /* Initialize function input argument 'PrePt'. */
  /* Initialize function input argument 'velo'. */
  /* Initialize function input argument 'HatPosition'. */
  /* Call the entry-point 'GetSelfLocation'. */
  argInit_3x1_real_T(dv1);
  argInit_3x3_real_T(dv2);
  argInit_1x2_real_T(dv3);
  argInit_3x1_real_T(dv4);
  GetSelfLocation(dv1, dv2, argInit_real_T(), dv3, dv4, EstPosition, EstPt,
                  &ObsZt);
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

  /* Initialize the application.
     You do not need to do this more than one time. */
  GetSelfLocation_initialize();

  /* Invoke the entry-point functions.
     You can call entry-point functions multiple times. */
  main_GetSelfLocation();

  /* Terminate the application.
     You do not need to do this more than one time. */
  GetSelfLocation_terminate();
  return 0;
}

/*
 * File trailer for main.c
 *
 * [EOF]
 */
