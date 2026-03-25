module SZLVTLB40_32X768X1CM1b1 (A,B,DO,DI,CKA,CKB,CSAN,DVSE,DVS,WEB,CSBN,NAP);

    output     [767:0]    DO;                 
    input      [767:0]    DI;                 
    input      [4:0]      A;                  
    input      [4:0]      B;                  
    input                 DVSE;                                    
    input      [3:0]      DVS;                
    input                 WEB;                                     
    input                 CKA;                                     
    input                 CKB;                                     
    input                 CSAN;                                    
    input                 CSBN;                                    
    input                 NAP;    

    SZLVTLB40_32X256X1CM1b1 ram_high (
        .A(A),
        .B(B),
        .DO(DO[767:512]),
        .DI(DI[767:512]),
        .CKA(CKA),
        .CKB(CKB),
        .CSAN(CSAN),
        .DVSE(DVSE),
        .DVS(DVS),
        .WEB(WEB),
        .CSBN(CSBN),
        .NAP(NAP)
    );
    SZLVTLB40_32X256X1CM1b1 ram_mid  (
        .A(A),
        .B(B),
        .DO(DO[511:256]),
        .DI(DI[511:256]),
        .CKA(CKA),
        .CKB(CKB),
        .CSAN(CSAN),
        .DVSE(DVSE),
        .DVS(DVS),
        .WEB(WEB),
        .CSBN(CSBN),
        .NAP(NAP)
    );
    SZLVTLB40_32X256X1CM1b1 ram_low  (
        .A(A),
        .B(B),
        .DO(DO[255:0]),
        .DI(DI[255:0]),
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