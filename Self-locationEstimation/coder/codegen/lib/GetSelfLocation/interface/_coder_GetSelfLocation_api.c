/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_GetSelfLocation_api.c
 *
 * MATLAB Coder version            : 4.2
 * C/C++ source code generated on  : 24-Mar-2020 14:05:57
 */

/* Include Files */
#include "tmwtypes.h"
#include "_coder_GetSelfLocation_api.h"
#include "_coder_GetSelfLocation_mex.h"

/* Variable Definitions */
emlrtCTX emlrtRootTLSGlobal = NULL;
static real_T ErrerParameter[4];
static uint32_T ErrerParameter_guard;
static real_T Qt;
static uint32_T Qt_guard;
static real_T Tred;
static uint32_T Tred_guard;
static real_T dt;
static uint32_T dt_guard;
emlrtContext emlrtContextGlobal = { true,/* bFirstTime */
  false,                               /* bInitialized */
  131482U,                             /* fVersionInfo */
  NULL,                                /* fErrorFunction */
  "GetSelfLocation",                   /* fFunctionName */
  NULL,                                /* fRTCallStack */
  false,                               /* bDebugMode */
  { 2045744189U, 2170104910U, 2743257031U, 4284093946U },/* fSigWrd */
  NULL                                 /* fSigMem */
};

/* Function Declarations */
static void GetSelfLocation_once(void);
static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, real_T y[4]);
static const mxArray *b_emlrt_marshallOut(const real_T u);
static real_T c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *b_Qt,
  const char_T *identifier);
static const mxArray *c_emlrt_marshallOut(const real_T u[3]);
static real_T d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId);
static const mxArray *d_emlrt_marshallOut(const real_T u[9]);
static real_T (*e_emlrt_marshallIn(const emlrtStack *sp, const mxArray
  *PrePosition, const char_T *identifier))[3];
static void emlrt_marshallIn(const emlrtStack *sp, const mxArray
  *b_ErrerParameter, const char_T *identifier, real_T y[4]);
static const mxArray *emlrt_marshallOut(const real_T u[4]);
static real_T (*f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[3];
static real_T (*g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *PrePt,
  const char_T *identifier))[9];
static real_T (*h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[9];
static real_T (*i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *velo,
  const char_T *identifier))[2];
static real_T (*j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[2];
static void k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, real_T ret[4]);
static real_T l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId);
static real_T (*m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[3];
static real_T (*n_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[9];
static real_T (*o_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[2];

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : void
 */
static void GetSelfLocation_once(void)
{
  dt_guard = 0U;
  Tred_guard = 0U;
  Qt_guard = 0U;
  ErrerParameter_guard = 0U;
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *u
 *                const emlrtMsgIdentifier *parentId
 *                real_T y[4]
 * Return Type  : void
 */
static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, real_T y[4])
{
  k_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

/*
 * Arguments    : const real_T u
 * Return Type  : const mxArray *
 */
static const mxArray *b_emlrt_marshallOut(const real_T u)
{
  const mxArray *y;
  const mxArray *m1;
  y = NULL;
  m1 = emlrtCreateDoubleScalar(u);
  emlrtAssign(&y, m1);
  return y;
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *b_Qt
 *                const char_T *identifier
 * Return Type  : real_T
 */
static real_T c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *b_Qt,
  const char_T *identifier)
{
  real_T y;
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = d_emlrt_marshallIn(sp, emlrtAlias(b_Qt), &thisId);
  emlrtDestroyArray(&b_Qt);
  return y;
}

/*
 * Arguments    : const real_T u[3]
 * Return Type  : const mxArray *
 */
static const mxArray *c_emlrt_marshallOut(const real_T u[3])
{
  const mxArray *y;
  const mxArray *m2;
  static const int32_T iv1[1] = { 0 };

  static const int32_T iv2[1] = { 3 };

  y = NULL;
  m2 = emlrtCreateNumericArray(1, iv1, mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m2, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m2, iv2, 1);
  emlrtAssign(&y, m2);
  return y;
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *u
 *                const emlrtMsgIdentifier *parentId
 * Return Type  : real_T
 */
static real_T d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = l_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

/*
 * Arguments    : const real_T u[9]
 * Return Type  : const mxArray *
 */
static const mxArray *d_emlrt_marshallOut(const real_T u[9])
{
  const mxArray *y;
  const mxArray *m3;
  static const int32_T iv3[2] = { 0, 0 };

  static const int32_T iv4[2] = { 3, 3 };

  y = NULL;
  m3 = emlrtCreateNumericArray(2, iv3, mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m3, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m3, iv4, 2);
  emlrtAssign(&y, m3);
  return y;
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *PrePosition
 *                const char_T *identifier
 * Return Type  : real_T (*)[3]
 */
static real_T (*e_emlrt_marshallIn(const emlrtStack *sp, const mxArray
  *PrePosition, const char_T *identifier))[3]
{
  real_T (*y)[3];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = f_emlrt_marshallIn(sp, emlrtAlias(PrePosition), &thisId);
  emlrtDestroyArray(&PrePosition);
  return y;
}
/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *b_ErrerParameter
 *                const char_T *identifier
 *                real_T y[4]
 * Return Type  : void
 */
  static void emlrt_marshallIn(const emlrtStack *sp, const mxArray
  *b_ErrerParameter, const char_T *identifier, real_T y[4])
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  b_emlrt_marshallIn(sp, emlrtAlias(b_ErrerParameter), &thisId, y);
  emlrtDestroyArray(&b_ErrerParameter);
}

/*
 * Arguments    : const real_T u[4]
 * Return Type  : const mxArray *
 */
static const mxArray *emlrt_marshallOut(const real_T u[4])
{
  const mxArray *y;
  const mxArray *m0;
  static const int32_T iv0[2] = { 1, 4 };

  real_T *pData;
  y = NULL;
  m0 = emlrtCreateNumericArray(2, iv0, mxDOUBLE_CLASS, mxREAL);
  pData = emlrtMxGetPr(m0);
  pData[0] = u[0];
  pData[1] = u[1];
  pData[2] = u[2];
  pData[3] = u[3];
  emlrtAssign(&y, m0);
  return y;
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *u
 *                const emlrtMsgIdentifier *parentId
 * Return Type  : real_T (*)[3]
 */
static real_T (*f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[3]
{
  real_T (*y)[3];
  y = m_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}
/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *PrePt
 *                const char_T *identifier
 * Return Type  : real_T (*)[9]
 */
  static real_T (*g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *PrePt,
  const char_T *identifier))[9]
{
  real_T (*y)[9];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = h_emlrt_marshallIn(sp, emlrtAlias(PrePt), &thisId);
  emlrtDestroyArray(&PrePt);
  return y;
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *u
 *                const emlrtMsgIdentifier *parentId
 * Return Type  : real_T (*)[9]
 */
static real_T (*h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[9]
{
  real_T (*y)[9];
  y = n_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}
/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *velo
 *                const char_T *identifier
 * Return Type  : real_T (*)[2]
 */
  static real_T (*i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *velo,
  const char_T *identifier))[2]
{
  real_T (*y)[2];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = j_emlrt_marshallIn(sp, emlrtAlias(velo), &thisId);
  emlrtDestroyArray(&velo);
  return y;
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *u
 *                const emlrtMsgIdentifier *parentId
 * Return Type  : real_T (*)[2]
 */
static real_T (*j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[2]
{
  real_T (*y)[2];
  y = o_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}
/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *src
 *                const emlrtMsgIdentifier *msgId
 *                real_T ret[4]
 * Return Type  : void
 */
  static void k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, real_T ret[4])
{
  static const int32_T dims[2] = { 1, 4 };

  real_T (*r0)[4];
  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 2U, dims);
  r0 = (real_T (*)[4])emlrtMxGetData(src);
  ret[0] = (*r0)[0];
  ret[1] = (*r0)[1];
  ret[2] = (*r0)[2];
  ret[3] = (*r0)[3];
  emlrtDestroyArray(&src);
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *src
 *                const emlrtMsgIdentifier *msgId
 * Return Type  : real_T
 */
static real_T l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId)
{
  real_T ret;
  static const int32_T dims = 0;
  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 0U, &dims);
  ret = *(real_T *)emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *src
 *                const emlrtMsgIdentifier *msgId
 * Return Type  : real_T (*)[3]
 */
static real_T (*m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[3]
{
  real_T (*ret)[3];
  static const int32_T dims[1] = { 3 };

  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 1U, dims);
  ret = (real_T (*)[3])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}
/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *src
 *                const emlrtMsgIdentifier *msgId
 * Return Type  : real_T (*)[9]
 */
  static real_T (*n_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[9]
{
  real_T (*ret)[9];
  static const int32_T dims[2] = { 3, 3 };

  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 2U, dims);
  ret = (real_T (*)[9])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

/*
 * Arguments    : const emlrtStack *sp
 *                const mxArray *src
 *                const emlrtMsgIdentifier *msgId
 * Return Type  : real_T (*)[2]
 */
static real_T (*o_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[2]
{
  real_T (*ret)[2];
  static const int32_T dims[2] = { 1, 2 };

  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 2U, dims);
  ret = (real_T (*)[2])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}
/*
 * Arguments    : const mxArray * const prhs[4]
 *                int32_T nlhs
 *                const mxArray *plhs[3]
 * Return Type  : void
 */
  void GetSelfLocation_api(const mxArray * const prhs[4], int32_T nlhs, const
  mxArray *plhs[3])
{
  real_T (*EstPosition)[3];
  real_T (*EstPt)[9];
  real_T (*PrePosition)[3];
  real_T (*PrePt)[9];
  real_T PreZt;
  real_T (*velo)[2];
  real_T ObsZt;
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;
  EstPosition = (real_T (*)[3])mxMalloc(sizeof(real_T [3]));
  EstPt = (real_T (*)[9])mxMalloc(sizeof(real_T [9]));

  /* Marshall function inputs */
  PrePosition = e_emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "PrePosition");
  PrePt = g_emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "PrePt");
  PreZt = c_emlrt_marshallIn(&st, emlrtAliasP(prhs[2]), "PreZt");
  velo = i_emlrt_marshallIn(&st, emlrtAlias(prhs[3]), "velo");

  /* Marshall in global variables */
  MEXGlobalSyncInFunction(&st);

  /* Invoke the target function */
  GetSelfLocation(*PrePosition, *PrePt, PreZt, *velo, *EstPosition, *EstPt,
                  &ObsZt);

  /* Marshall out global variables */
  MEXGlobalSyncOutFunction(true);

  /* Marshall function outputs */
  plhs[0] = c_emlrt_marshallOut(*EstPosition);
  if (nlhs > 1) {
    plhs[1] = d_emlrt_marshallOut(*EstPt);
  }

  if (nlhs > 2) {
    plhs[2] = b_emlrt_marshallOut(ObsZt);
  }
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void GetSelfLocation_atexit(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  GetSelfLocation_xil_terminate();
  GetSelfLocation_xil_shutdown();
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void GetSelfLocation_initialize(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, 0);
  emlrtEnterRtStackR2012b(&st);
  if (emlrtFirstTimeR2012b(emlrtRootTLSGlobal)) {
    GetSelfLocation_once();
  }
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void GetSelfLocation_terminate(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/*
 * Arguments    : const emlrtStack *sp
 * Return Type  : void
 */
void MEXGlobalSyncInFunction(const emlrtStack *sp)
{
  const mxArray *tmp;
  const mxArray *b_tmp;
  const mxArray *c_tmp;
  const mxArray *d_tmp;

  /* Marshall in global variables */
  tmp = emlrtGetGlobalVariable("ErrerParameter");
  if (tmp != NULL) {
    emlrt_marshallIn(sp, tmp, "ErrerParameter", ErrerParameter);
    ErrerParameter_guard = 1U;
  }

  b_tmp = emlrtGetGlobalVariable("Qt");
  if (b_tmp != NULL) {
    Qt = c_emlrt_marshallIn(sp, b_tmp, "Qt");
    Qt_guard = 1U;
  }

  c_tmp = emlrtGetGlobalVariable("Tred");
  if (c_tmp != NULL) {
    Tred = c_emlrt_marshallIn(sp, c_tmp, "Tred");
    Tred_guard = 1U;
  }

  d_tmp = emlrtGetGlobalVariable("dt");
  if (d_tmp != NULL) {
    dt = c_emlrt_marshallIn(sp, d_tmp, "dt");
    dt_guard = 1U;
  }
}

/*
 * Arguments    : boolean_T skipDirtyCheck
 * Return Type  : void
 */
void MEXGlobalSyncOutFunction(boolean_T skipDirtyCheck)
{
  /* Marshall out global variables */
  if (skipDirtyCheck || (ErrerParameter_guard != 0U)) {
    emlrtPutGlobalVariable("ErrerParameter", emlrt_marshallOut(ErrerParameter));
  }

  if (skipDirtyCheck || (Qt_guard != 0U)) {
    emlrtPutGlobalVariable("Qt", b_emlrt_marshallOut(Qt));
  }

  if (skipDirtyCheck || (Tred_guard != 0U)) {
    emlrtPutGlobalVariable("Tred", b_emlrt_marshallOut(Tred));
  }

  if (skipDirtyCheck || (dt_guard != 0U)) {
    emlrtPutGlobalVariable("dt", b_emlrt_marshallOut(dt));
  }
}

/*
 * File trailer for _coder_GetSelfLocation_api.c
 *
 * [EOF]
 */
