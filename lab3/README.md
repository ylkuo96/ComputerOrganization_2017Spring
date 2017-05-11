# Lab3 

## single clock-cycle CPU with memory_componenet

![Architecture Diagram](./lab3_architecture_daigram.png)

*this cpuis able to run R-type, I-type, and J type instructions*



* Reg_File[29] represents stack point initialized to 128, others are 0.

## Instrucitons added ( compare to Lab2 )

* LW
* SW
* J
* MUL
* JAL
* JR
* BLE
* BLT
* BNEZ
* LI

NOTE: The **BNE**, **LUI** instructions are deleted in this Lab session

## Instruciton supported ( from Lab2 )

* add
* sub
* and
* or
* slt  ( Set on Less Than )
* sltu ( slt Unsigned )
* addi ( Add Immeidate )
* beq  (Branch on Equal)
* ori  (Or Immeidate )



