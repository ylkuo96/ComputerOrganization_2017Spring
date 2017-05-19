# Lab4 Pipelined CPU

 implementing a simple version 5-stage pipelined CPU

## basic instructions supported

+ ADD
+ ADDI
+ SUB
+ AND
+ OR
+ SLT
+ SLTU
+ SLL
+ SLLV
+ LUI
+ ORI
+ LW
+ SW
+ MUL

## Advanced feature

BEQ, BNE insrtuctions added 

Having **Hazard Detection** and **Forwarding machanism**


instruction format

## R-type

|Instruciton | Example | Meaning | OP field | Function field |
|:-:        |:-:   |:-:| :-:|:-:|
|AND| and r1,r2,r3| r1 = r2&r3| 0 | 36(0x24) | 
|OR| or r1,r2,r3| r1 = r2\|r3| 0 | 37(0x25) | 
|ADD| add r1,r2,r3| r1 = r2+r3| 0 | 32(0x20) | 
|SUB| sub r1,r2,r3| r1 = r2-r3| 0 | 34(0x22) |
|MUL| mul r1,r2,r3| r1 = r2*r3| 0 | 24(0x18) |
|SLT| slt r1,r2,r3| r1 = (r2<r3) ? 1:0 | 0 | 42(0x2a) |
|SLTU| sltu r1,r2, r3(unsigned)| r1 = (r2<r3) ? 1:0 | 0 | 43(0x2b) |
|SLL| sll r1,r2,10| r1 = r2<<10 | 0 | 0 |
|SLLV| sllv r1,r2,r3| r1 = r2<<r3 | 0 | 4 |


## I-type
**No funct field exists** 

|Instruciton|Example | Meaning | OP field| Rs | Rt| immdt(in example) |
|:-:|:-:|:-:|:-:|:-:| :-:|:-:|
|ADDI|addi r1,r2,100 |r1=r2+100| 8 |r2|r1|100|
|ORI|ori r1,r2,100 |r1=r2\|100| 13 |r2|r1|100|
|BNE|bne r1,r2,30 |if( r1!=r2) goto **(PC+4)**+120| 5 |r2|r1|30|
|BEQ|bne r1,r2,25 |if( r1==r2) goto **(PC+4)**+100| 4 |r2|r1|25|
|LUI|lui r1,10 | r1 = 10<<16| 15 |x|r1|10|
|LW|lw r1,r2,12| r1=MEM[r2+12]| 35 |r1|r2|12|
|SW|sw r1,r2,12| MEM[r2+12]=r1| 43 |r1|r2|12|


 