This is the detailed eplaination of this lab 


1.Adder1
	這個加法器主要是在做PC+4的作用，背後的理念是基於make common case fast, 因為程式的執行就是一行行的從記憶體讀取指令，大部分時間PC都只是穩定的往下個記憶體位址移動讀取，而且這樣讓PC提早產出的方法有助pipeline的使用(讓下一個stage可以使用PC)。
 
2.Decoder
	Decoder的目的就是看32bit 指令前六碼的值，並且依據這些值來建立每種指令專有的datapath。另外，指令編碼也要考慮decoder的存在，讓每種6 bit operation code都只對應到一種datapath. 
	這個module使用了verilog的bus功能(應該是這樣叫？)，寫起來很簡單，在don’t care的地方也可以直接寫 don’t care。讓ise自行化簡。

3.Mux_Write_Reg
	這個多工器主要是讓RegisterFile 拿到要寫入register 的位址。由於這個ISA支援指令分為兩種(I-type, R-type)，所以每個欄位在不同指令下會有不同意義，這裡就是要得知每個指令的RT 欄位在何處，所以會需要透過decoder 解析指令型別後傳入控制訊號到模組中，才能建立正確的datapath.
 
4.Signed Extension
	原本指令的架構最多只能有16 bit immediate value，但是在運算時都是使用32bit做運算，在這裡會把16bit有號整數值透過sign extension機制轉變為32 bit,
實際上就是把16bit的MSB直接拿來填滿32bit中額外的16bit。

5.Alu_contrl
	ALU_control 需要知道ALU時機要做的運算，所以要解析指令是屬於何種型別，在解析型別時會先需要看指令的OP field 是哪種，如果是op field 對應到的值是0的話表示為R-type, 如果對應到4,8,5,13,15 就是I-type。

6.Shifter
	這個模組會將32bit value直接左移兩格，有可能會想說32bit signed 跟 unsigned 對資料直接左移兩格會不會得到對應的結果(ex. -2 shift left2 會不會得到 -8 )，後來實測是會的，所以這個模組對有號無號整數具有通用性。

7.Adder2
	這個加法器是拿來運算出跳轉時對應的位址（如果有要跳轉的話），數值來源來自於已經加4的PC 值跟指令中32bit sign extended 的 immediate值。

8.Mux_ALUSrc
	由於指令有兩種型態，ALU的資料來源可能會是暫存器的值或是指令中的16 bit immediate value。

9.ALU
	這個模組，執行所有的運算，就跟指令要求的一樣直觀，只是在這裡有令指令並沒有實踐，
像是BEQ ， ALU實際得到要做運算是減法指令，最後用ALU 的ZERO輸出確認是否為零就能知道兩數是否相等

10.Mux_PC_Source 
	因為PC在這個指令架構中會有兩種移動方式，第一種是序列讀取，第二種是直接跳轉，所以需要一個多工器來讓PC接受兩種不同結果帶來的值。第一種移動方式來自於 Adder1(第一項)，而第二種移動方式來自於Adder2(第七項)。
	唯一一點要注意的是選擇訊號來自於decoder 給的branch訊號 跟 ALU 的zero訊號進行and運算，因為就算預設的datapath可能會因為branch系列指令而跳轉，我們還是需要透過ALU運算是否有達到跳轉條件(ex. BEQ 只在 兩數相等時跳轉)。
