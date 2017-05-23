//Subject:     CO project 4
//--------------------------------------------
//Student: 0411276 Chen Yi An
//Student: 0413335 Kuo Yi Lin
//--------------------------------------------

module Hazard_detection_Unit(
    input   EX_MemRead,
    input   ID_RegisterRs,
    input   ID_RegisterRt,
    input   EX_RegisterRt,

    input   MEM_Branch, 

    output  PCWrite,
    output  IF_ID_Write,
    output  IF_ID_FLUSH,
    output  ID_EX_Flush
);
/**
因為有Branch 的存在, 所以pipeLined CPU會需要 簡單的Branch prediction機制
與 Exception( 預測錯誤 )

這個cpu 的branch 機制是假設branch always not taken
所以 branch signal 一但為true, 就要清空前面的 pipeLine ( clear )

一但發生 load use hazard , 就要產生 stall
*/



endmodule