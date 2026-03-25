module SZLVTLB40_32X544X1CM1b1 (A,B,DO,DI,CKA,CKB,CSAN,DVSE,DVS,WEB,CSBN,NAP);

    output     [543:0]    DO;                 
    input      [543:0]    DI;                 
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

    SZLVTLB40_32X272X1CM1b1 ram_high (
        .A(A),
        .B(B),
        .DO(DO[543:272]),
        .DI(DI[543:272]),
        .CKA(CKA),
        .CKB(CKB),
        .CSAN(CSAN),
        .DVSE(DVSE),
        .DVS(DVS),
        .WEB(WEB),
        .CSBN(CSBN),
        .NAP(NAP)
    );
    SZLVTLB40_32X272X1CM1b1 ram_low  (
        .A(A),
        .B(B),
        .DO(DO[271:0]),
        .DI(DI[271:0]),
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
