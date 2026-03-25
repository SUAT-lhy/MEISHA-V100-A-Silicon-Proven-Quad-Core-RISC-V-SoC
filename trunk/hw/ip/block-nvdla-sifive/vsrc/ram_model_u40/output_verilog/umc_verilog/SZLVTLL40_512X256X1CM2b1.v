module SZLVTLL40_512X256X1CM2b1 (A,B,DO,DI,CKA,CKB,CSAN,DVSE,DVS,WEB,CSBN,NAP);

    output     [255:0]    DO;                 
    input      [255:0]    DI;                 
    input      [8:0]      A;                  
    input      [8:0]      B;                  
    input                 DVSE;                                    
    input      [3:0]      DVS;                
    input                 WEB;                                     
    input                 CKA;                                     
    input                 CKB;                                     
    input                 CSAN;                                    
    input                 CSBN;                                    
    input                 NAP;    

    SZLVTLL40_512X128X1CM2b1 ram_high (
        .A(A),
        .B(B),
        .DO(DO[255:128]),
        .DI(DI[255:128]),
        .CKA(CKA),
        .CKB(CKB),
        .CSAN(CSAN),
        .DVSE(DVSE),
        .DVS(DVS),
        .WEB(WEB),
        .CSBN(CSBN),
        .NAP(NAP)
    );
    SZLVTLL40_512X128X1CM2b1 ram_low  (
        .A(A),
        .B(B),
        .DO(DO[127:0]),
        .DI(DI[127:0]),
        .CKA(CKA),
        .CKB(CKB),
        .CSAN(CSAN),
        .DVSE(DVSE),
        .DVS(DVS),
        .WEB(WEB),
        .CSBN(CSBN),
        .NAP(NAP)
    );

endmodule




// CKA Input Clock signal for A-port addresses and CSAN, latched at the rising edge 
// CKB Input Clock signal for B-port addresses, CSBN, WEB, and DI, latched at the rising edge 
// A[m-1:0] Input Read address signals of width m 
// B[m-1:0] Input Write address signals of width m 
// DI[w-1:0] Input Input data of width w 
// DVSE Input Delay option enable signal 
// Active high 

// DVS[3:0] Input Delay option control word is valid when DVSE = 1. 
// CSAN Input Chip select for A-port 
// Active low 

// CSBN Input Chip select for B-port 
// Active low 

// WEB[b-1:0] Input Write enable signal of b bytes 
// Active low 

// NAP Input NAP mode enable  
// Asynchronous 
// Active high 

// DO[w-1:0] Output Output data of width w  