/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//Mac/Home/Desktop/ComputerOrgan/code/lab1/sourceCode/compare.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {6U, 0U};
static unsigned int ng6[] = {4U, 0U};
static unsigned int ng7[] = {7U, 0U};



static void Always_28_0(char *t0)
{
    char t9[8];
    char t27[8];
    char t60[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    int t51;
    int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;

LAB0:    t1 = (t0 + 3640U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 3960);
    *((int *)t2) = 1;
    t3 = (t0 + 3672);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(28, ng0);

LAB5:    xsi_set_current_line(29, ng0);
    t4 = (t0 + 2320U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB19;

LAB20:
LAB22:
LAB21:    xsi_set_current_line(37, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2720);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB23:    goto LAB2;

LAB7:    xsi_set_current_line(30, ng0);
    t7 = (t0 + 2000U);
    t8 = *((char **)t7);
    t7 = (t0 + 2160U);
    t10 = *((char **)t7);
    memset(t9, 0, 8);
    t7 = (t10 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB27;

LAB25:    if (*((unsigned int *)t7) == 0)
        goto LAB24;

LAB26:    t16 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t16) = 1;

LAB27:    t17 = (t9 + 4);
    t18 = (t10 + 4);
    t19 = *((unsigned int *)t10);
    t20 = (~(t19));
    *((unsigned int *)t9) = t20;
    *((unsigned int *)t17) = 0;
    if (*((unsigned int *)t18) != 0)
        goto LAB29;

LAB28:    t25 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t25 & 1U);
    t26 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t26 & 1U);
    t28 = *((unsigned int *)t8);
    t29 = *((unsigned int *)t9);
    t30 = (t28 & t29);
    *((unsigned int *)t27) = t30;
    t31 = (t8 + 4);
    t32 = (t9 + 4);
    t33 = (t27 + 4);
    t34 = *((unsigned int *)t31);
    t35 = *((unsigned int *)t32);
    t36 = (t34 | t35);
    *((unsigned int *)t33) = t36;
    t37 = *((unsigned int *)t33);
    t38 = (t37 != 0);
    if (t38 == 1)
        goto LAB30;

LAB31:
LAB32:    t59 = (t0 + 2720);
    xsi_vlogvar_wait_assign_value(t59, t27, 0, 0, 1, 0LL);
    goto LAB23;

LAB9:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 2000U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t4 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB36;

LAB34:    if (*((unsigned int *)t3) == 0)
        goto LAB33;

LAB35:    t7 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t7) = 1;

LAB36:    t8 = (t9 + 4);
    t10 = (t4 + 4);
    t19 = *((unsigned int *)t4);
    t20 = (~(t19));
    *((unsigned int *)t9) = t20;
    *((unsigned int *)t8) = 0;
    if (*((unsigned int *)t10) != 0)
        goto LAB38;

LAB37:    t25 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t25 & 1U);
    t26 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t26 & 1U);
    t16 = (t0 + 2160U);
    t17 = *((char **)t16);
    memset(t27, 0, 8);
    t16 = (t17 + 4);
    t28 = *((unsigned int *)t16);
    t29 = (~(t28));
    t30 = *((unsigned int *)t17);
    t34 = (t30 & t29);
    t35 = (t34 & 1U);
    if (t35 != 0)
        goto LAB42;

LAB40:    if (*((unsigned int *)t16) == 0)
        goto LAB39;

LAB41:    t18 = (t27 + 4);
    *((unsigned int *)t27) = 1;
    *((unsigned int *)t18) = 1;

LAB42:    t31 = (t27 + 4);
    t32 = (t17 + 4);
    t36 = *((unsigned int *)t17);
    t37 = (~(t36));
    *((unsigned int *)t27) = t37;
    *((unsigned int *)t31) = 0;
    if (*((unsigned int *)t32) != 0)
        goto LAB44;

LAB43:    t44 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t44 & 1U);
    t45 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t45 & 1U);
    t46 = *((unsigned int *)t9);
    t47 = *((unsigned int *)t27);
    t48 = (t46 & t47);
    *((unsigned int *)t60) = t48;
    t33 = (t9 + 4);
    t41 = (t27 + 4);
    t42 = (t60 + 4);
    t49 = *((unsigned int *)t33);
    t50 = *((unsigned int *)t41);
    t53 = (t49 | t50);
    *((unsigned int *)t42) = t53;
    t54 = *((unsigned int *)t42);
    t55 = (t54 != 0);
    if (t55 == 1)
        goto LAB45;

LAB46:
LAB47:    t75 = (t0 + 2720);
    xsi_vlogvar_wait_assign_value(t75, t60, 0, 0, 1, 0LL);
    goto LAB23;

LAB11:    xsi_set_current_line(32, ng0);
    t3 = (t0 + 2000U);
    t4 = *((char **)t3);
    t3 = (t0 + 2160U);
    t7 = *((char **)t3);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t7);
    t13 = (t11 | t12);
    *((unsigned int *)t9) = t13;
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t10 = (t9 + 4);
    t14 = *((unsigned int *)t3);
    t15 = *((unsigned int *)t8);
    t19 = (t14 | t15);
    *((unsigned int *)t10) = t19;
    t20 = *((unsigned int *)t10);
    t21 = (t20 != 0);
    if (t21 == 1)
        goto LAB48;

LAB49:
LAB50:    t18 = (t0 + 2720);
    xsi_vlogvar_wait_assign_value(t18, t9, 0, 0, 1, 0LL);
    goto LAB23;

LAB13:    xsi_set_current_line(33, ng0);
    t3 = (t0 + 2000U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t4 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB54;

LAB52:    if (*((unsigned int *)t3) == 0)
        goto LAB51;

LAB53:    t7 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t7) = 1;

LAB54:    t8 = (t9 + 4);
    t10 = (t4 + 4);
    t19 = *((unsigned int *)t4);
    t20 = (~(t19));
    *((unsigned int *)t9) = t20;
    *((unsigned int *)t8) = 0;
    if (*((unsigned int *)t10) != 0)
        goto LAB56;

LAB55:    t25 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t25 & 1U);
    t26 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t26 & 1U);
    t16 = (t0 + 2160U);
    t17 = *((char **)t16);
    t28 = *((unsigned int *)t9);
    t29 = *((unsigned int *)t17);
    t30 = (t28 | t29);
    *((unsigned int *)t27) = t30;
    t16 = (t9 + 4);
    t18 = (t17 + 4);
    t31 = (t27 + 4);
    t34 = *((unsigned int *)t16);
    t35 = *((unsigned int *)t18);
    t36 = (t34 | t35);
    *((unsigned int *)t31) = t36;
    t37 = *((unsigned int *)t31);
    t38 = (t37 != 0);
    if (t38 == 1)
        goto LAB57;

LAB58:
LAB59:    t41 = (t0 + 2720);
    xsi_vlogvar_wait_assign_value(t41, t27, 0, 0, 1, 0LL);
    goto LAB23;

LAB15:    xsi_set_current_line(34, ng0);
    t3 = (t0 + 2160U);
    t4 = *((char **)t3);
    t3 = (t0 + 2000U);
    t7 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t7 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t7);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB63;

LAB61:    if (*((unsigned int *)t3) == 0)
        goto LAB60;

LAB62:    t8 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t8) = 1;

LAB63:    t10 = (t9 + 4);
    t16 = (t7 + 4);
    t19 = *((unsigned int *)t7);
    t20 = (~(t19));
    *((unsigned int *)t9) = t20;
    *((unsigned int *)t10) = 0;
    if (*((unsigned int *)t16) != 0)
        goto LAB65;

LAB64:    t25 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t25 & 1U);
    t26 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t26 & 1U);
    t28 = *((unsigned int *)t4);
    t29 = *((unsigned int *)t9);
    t30 = (t28 & t29);
    *((unsigned int *)t27) = t30;
    t17 = (t4 + 4);
    t18 = (t9 + 4);
    t31 = (t27 + 4);
    t34 = *((unsigned int *)t17);
    t35 = *((unsigned int *)t18);
    t36 = (t34 | t35);
    *((unsigned int *)t31) = t36;
    t37 = *((unsigned int *)t31);
    t38 = (t37 != 0);
    if (t38 == 1)
        goto LAB66;

LAB67:
LAB68:    t41 = (t0 + 2720);
    xsi_vlogvar_wait_assign_value(t41, t27, 0, 0, 1, 0LL);
    goto LAB23;

LAB17:    xsi_set_current_line(35, ng0);
    t3 = (t0 + 2160U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t4 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB72;

LAB70:    if (*((unsigned int *)t3) == 0)
        goto LAB69;

LAB71:    t7 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t7) = 1;

LAB72:    t8 = (t9 + 4);
    t10 = (t4 + 4);
    t19 = *((unsigned int *)t4);
    t20 = (~(t19));
    *((unsigned int *)t9) = t20;
    *((unsigned int *)t8) = 0;
    if (*((unsigned int *)t10) != 0)
        goto LAB74;

LAB73:    t25 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t25 & 1U);
    t26 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t26 & 1U);
    t16 = (t0 + 2720);
    xsi_vlogvar_wait_assign_value(t16, t9, 0, 0, 1, 0LL);
    goto LAB23;

LAB19:    xsi_set_current_line(36, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 2720);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 1, 0LL);
    goto LAB23;

LAB24:    *((unsigned int *)t9) = 1;
    goto LAB27;

LAB29:    t21 = *((unsigned int *)t9);
    t22 = *((unsigned int *)t18);
    *((unsigned int *)t9) = (t21 | t22);
    t23 = *((unsigned int *)t17);
    t24 = *((unsigned int *)t18);
    *((unsigned int *)t17) = (t23 | t24);
    goto LAB28;

LAB30:    t39 = *((unsigned int *)t27);
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t27) = (t39 | t40);
    t41 = (t8 + 4);
    t42 = (t9 + 4);
    t43 = *((unsigned int *)t8);
    t44 = (~(t43));
    t45 = *((unsigned int *)t41);
    t46 = (~(t45));
    t47 = *((unsigned int *)t9);
    t48 = (~(t47));
    t49 = *((unsigned int *)t42);
    t50 = (~(t49));
    t51 = (t44 & t46);
    t52 = (t48 & t50);
    t53 = (~(t51));
    t54 = (~(t52));
    t55 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t55 & t53);
    t56 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t56 & t54);
    t57 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t57 & t53);
    t58 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t58 & t54);
    goto LAB32;

LAB33:    *((unsigned int *)t9) = 1;
    goto LAB36;

LAB38:    t21 = *((unsigned int *)t9);
    t22 = *((unsigned int *)t10);
    *((unsigned int *)t9) = (t21 | t22);
    t23 = *((unsigned int *)t8);
    t24 = *((unsigned int *)t10);
    *((unsigned int *)t8) = (t23 | t24);
    goto LAB37;

LAB39:    *((unsigned int *)t27) = 1;
    goto LAB42;

LAB44:    t38 = *((unsigned int *)t27);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t27) = (t38 | t39);
    t40 = *((unsigned int *)t31);
    t43 = *((unsigned int *)t32);
    *((unsigned int *)t31) = (t40 | t43);
    goto LAB43;

LAB45:    t56 = *((unsigned int *)t60);
    t57 = *((unsigned int *)t42);
    *((unsigned int *)t60) = (t56 | t57);
    t59 = (t9 + 4);
    t61 = (t27 + 4);
    t58 = *((unsigned int *)t9);
    t62 = (~(t58));
    t63 = *((unsigned int *)t59);
    t64 = (~(t63));
    t65 = *((unsigned int *)t27);
    t66 = (~(t65));
    t67 = *((unsigned int *)t61);
    t68 = (~(t67));
    t51 = (t62 & t64);
    t52 = (t66 & t68);
    t69 = (~(t51));
    t70 = (~(t52));
    t71 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t71 & t69);
    t72 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t72 & t70);
    t73 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t73 & t69);
    t74 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t74 & t70);
    goto LAB47;

LAB48:    t22 = *((unsigned int *)t9);
    t23 = *((unsigned int *)t10);
    *((unsigned int *)t9) = (t22 | t23);
    t16 = (t4 + 4);
    t17 = (t7 + 4);
    t24 = *((unsigned int *)t16);
    t25 = (~(t24));
    t26 = *((unsigned int *)t4);
    t51 = (t26 & t25);
    t28 = *((unsigned int *)t17);
    t29 = (~(t28));
    t30 = *((unsigned int *)t7);
    t52 = (t30 & t29);
    t34 = (~(t51));
    t35 = (~(t52));
    t36 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t36 & t34);
    t37 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t37 & t35);
    goto LAB50;

LAB51:    *((unsigned int *)t9) = 1;
    goto LAB54;

LAB56:    t21 = *((unsigned int *)t9);
    t22 = *((unsigned int *)t10);
    *((unsigned int *)t9) = (t21 | t22);
    t23 = *((unsigned int *)t8);
    t24 = *((unsigned int *)t10);
    *((unsigned int *)t8) = (t23 | t24);
    goto LAB55;

LAB57:    t39 = *((unsigned int *)t27);
    t40 = *((unsigned int *)t31);
    *((unsigned int *)t27) = (t39 | t40);
    t32 = (t9 + 4);
    t33 = (t17 + 4);
    t43 = *((unsigned int *)t32);
    t44 = (~(t43));
    t45 = *((unsigned int *)t9);
    t51 = (t45 & t44);
    t46 = *((unsigned int *)t33);
    t47 = (~(t46));
    t48 = *((unsigned int *)t17);
    t52 = (t48 & t47);
    t49 = (~(t51));
    t50 = (~(t52));
    t53 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t53 & t49);
    t54 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t54 & t50);
    goto LAB59;

LAB60:    *((unsigned int *)t9) = 1;
    goto LAB63;

LAB65:    t21 = *((unsigned int *)t9);
    t22 = *((unsigned int *)t16);
    *((unsigned int *)t9) = (t21 | t22);
    t23 = *((unsigned int *)t10);
    t24 = *((unsigned int *)t16);
    *((unsigned int *)t10) = (t23 | t24);
    goto LAB64;

LAB66:    t39 = *((unsigned int *)t27);
    t40 = *((unsigned int *)t31);
    *((unsigned int *)t27) = (t39 | t40);
    t32 = (t4 + 4);
    t33 = (t9 + 4);
    t43 = *((unsigned int *)t4);
    t44 = (~(t43));
    t45 = *((unsigned int *)t32);
    t46 = (~(t45));
    t47 = *((unsigned int *)t9);
    t48 = (~(t47));
    t49 = *((unsigned int *)t33);
    t50 = (~(t49));
    t51 = (t44 & t46);
    t52 = (t48 & t50);
    t53 = (~(t51));
    t54 = (~(t52));
    t55 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t55 & t53);
    t56 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t56 & t54);
    t57 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t57 & t53);
    t58 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t58 & t54);
    goto LAB68;

LAB69:    *((unsigned int *)t9) = 1;
    goto LAB72;

LAB74:    t21 = *((unsigned int *)t9);
    t22 = *((unsigned int *)t10);
    *((unsigned int *)t9) = (t21 | t22);
    t23 = *((unsigned int *)t8);
    t24 = *((unsigned int *)t10);
    *((unsigned int *)t8) = (t23 | t24);
    goto LAB73;

}


extern void work_m_00000000000118342636_3842173357_init()
{
	static char *pe[] = {(void *)Always_28_0};
	xsi_register_didat("work_m_00000000000118342636_3842173357", "isim/testbench_isim_beh.exe.sim/work/m_00000000000118342636_3842173357.didat");
	xsi_register_executes(pe);
}
