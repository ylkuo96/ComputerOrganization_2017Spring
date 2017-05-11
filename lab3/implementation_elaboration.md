immdt表示在指令中直接附帶的，當運算數值使用的欄位

Decoder
    考量到要輸出的訊號量日益增加，且未來的Lab勢必會對CPU進行擴充，為了提升維護性與可讀性，我把訊號依據
    用途分類，並指定對應的常數來操作這些控制訊號，讓控制訊號使用起來較模組化，這樣雖然花了不少時間，但
    是後來再更動設計時的成本會減少不少,而且也可以用這些較好閱讀的常數來避免打錯數字造成難以找出的bug。
    自從改成這種形式後，debug快了不少。
    在常數之中，DONTCARE1, DONCARE2, DONTCARE4 具有特別用途，就是不指明運算，當控制訊號被指派這些
    常數時代表這些指令並不會用到對應的硬體資源。

MUX_4to1
    我新增這個4to1的Mux，但是大部分的時間都是拿來做成3to1,考量到兩種Mux的sel訊號都是2bit,在介面完全
    相同，且花費的硬體資源應該相近，不需要為了單純時間3to1的功能而作出一個3to1的Mux。

5.Simple_Single.CPU
    這次的最大更動就是
        1.Memory的加入
        2.branch指令的擴充
        3.為特殊型態指令( j, jr,jal)新增新的datapath 
    分項來討論對應所做的更動
    ## 1.Memory 的加入 
        在RF的WriteBack Data之前加入一個Mux,選擇要寫入的資料來源，但是Mux中還有令一個資料來源是
        來自immdt value(為了LI指令實踐的)，
    ## 2. branch 指令的擴充
        ALU在這個指令集中並沒有為branch指令時做出新的電路(除了bnez以外)， 針對branch指令，我將ALU
        的輸出特別在 Mux_ALU_Branch_type這個Mux之前做了組合電路的預處理，對每種Branch類型產生出
        對應的材料。
    ## 3.為特殊型態指令做的擴充
        + j 指令
            重寫了PC的輸入之前的Mux( Mux_PC_Source ),由原本的 2to1 變成3to1，主要是為了接收
            來自j指令中的immdt值，還有jr指令所帶來的值。需要注意的是，在Mux_PC_Source在Lab2跟
            Lab3中的用途並不相同，Lab2中對應的硬體已經被改稱為Lab3另外一個Mux
            (Mux_Branch_or_PCAdd4)
        + jr
            這個指令需要將RegisterFile中讀出的$rs直接接上pc。所以我將RF讀出的$rs訊號(aluSrc1)
            拉上 Mux_PC_Source 中
        + jal 
            這個指令需要將PC+4的值直接寫入$ra中，所以必須要做兩個更動
                1.讓RF收到 $ra的位址以便寫入
                    在修改量最小的希望下，我選擇更動RF之前的Mux(Mux_Write_Reg)，由2to1 變成
                    3to1,新增一個選項就是$ra的位址(5'31),這樣在收到 jal指令的時候就能夠直接傳入
                     ra而不修改RF模組。 
                2.讓RF收到 PC+4的值
                    我選擇修改ALU,讓ALU新增一個輸入埠(PC+4)，在收到jal指令時直接輸出PC+4的值，
                    提供給RF當作寫入資料

ALU_ctrl
    實作方法完全跟上一個lab相同，除了對此次lab的新指令新增常數來解析。
    特別要注意的是，對應到Decoder指明的 DONTCARE value，這個模組只會針對需要做運算的指令做運算，
    沒指明的情況就只會往下傳遞 DONCARE value。

ALU
    只有根據新指令直接新增一些對應的運算，不太需要特別解釋。
