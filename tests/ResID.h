// Generated by the Resource Link v1.13
//    !author: Jiang Yu-Kuan <yukuan.jiang@gmail.com>
//    !trail: reslnk.exe id -oResID.h res.lst
#ifndef _RES_ID_H
#define _RES_ID_H


/** IDs of Resources */
typedef enum {
    RES_ENGLISH_BEGIN,
    RES_O8B_NavWordsSdOnEn = RES_ENGLISH_BEGIN,
    RES_O8B_NavWordsSdOffEn,
    RES_O8B_NavWordsHddOnEn,
    RES_O8B_NavWordsHddOffEn,
    RES_O8B_NavWordsLightOnEn,
    RES_ENGLISH_END,

    RES_JPG_BEGIN = RES_ENGLISH_END,
    RES_JPG_1min = RES_JPG_BEGIN,
    RES_JPG_25percent,
    RES_JPG_Cam1Select,
    RES_JPG_Cam1Unselect,
    RES_JPG_Cam2Select,
    RES_JPG_END,

    RES_O8B_BEGIN = RES_JPG_END,
    RES_O8B_KeypadNumeric = RES_O8B_BEGIN,
    RES_O8B_BtnPwdBgLine,
    RES_O8B_FormGridContinus,
    RES_O8B_FormGridMotion,
    RES_O8B_FormGridNone,
    RES_O8B_END,

    RES_FONT1_BEGIN = RES_O8B_END,
    RES_O8B_ChSymSpace = RES_FONT1_BEGIN,
    RES_O8B_ChSymExclam,
    RES_O8B_ChSymDquotes,
    RES_O8B_ChSymSharp,
    RES_O8B_ChSymDollar,
    RES_FONT1_END,

    RES_CURSOR_BEGIN = RES_FONT1_END,
    RES_O8B_CursorArrow = RES_CURSOR_BEGIN,
    RES_O8B_CursorHand,
    RES_O8B_CursorSandglass,
    RES_O8B_CursorForbid,
    RES_CURSOR_END,

    RES_End = RES_CURSOR_END,
    RES_Total = RES_End
} ResID;


#endif // _RES_ID_H