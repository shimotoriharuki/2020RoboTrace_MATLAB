  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 1;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtP)
    ;%
      section.nData     = 20;
      section.data(20)  = dumData; %prealloc
      
	  ;% rtP.L
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtP.Pixels
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtP.SensorAngle
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 1000001;
	
	  ;% rtP.SensorNumber
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 1000002;
	
	  ;% rtP.SensorRadius
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 1000003;
	
	  ;% rtP.SensorRange
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 1000004;
	
	  ;% rtP.Tvelo
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 1000005;
	
	  ;% rtP.scale
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 1000006;
	
	  ;% rtP.DiscreteTimeIntegrator2_gainval
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 1000007;
	
	  ;% rtP.DiscreteTimeIntegrator2_IC
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 1000008;
	
	  ;% rtP.DiscreteTimeIntegrator1_gainval
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 1000009;
	
	  ;% rtP.DiscreteTimeIntegrator1_IC
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 1000010;
	
	  ;% rtP.DiscreteTimeIntegrator_gainval
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 1000011;
	
	  ;% rtP.DiscreteTimeIntegrator_IC
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 1000012;
	
	  ;% rtP.DataStoreMemory1_InitialValue
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 1000013;
	
	  ;% rtP.DataStoreMemory2_InitialValue
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 1000014;
	
	  ;% rtP.DataStoreMemory3_InitialValue
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 1000015;
	
	  ;% rtP.DataStoreMemory4_InitialValue
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 1000016;
	
	  ;% rtP.DataStoreMemory5_InitialValue
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 1000017;
	
	  ;% rtP.DataStoreMemory7_InitialValue
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 1000018;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 1;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtB)
    ;%
      section.nData     = 15;
      section.data(15)  = dumData; %prealloc
      
	  ;% rtB.hgvcypb44z
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtB.ofuexryd5s
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtB.lw0eucomel
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% rtB.jvxitaw4eg
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% rtB.i5igcfvlny
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 6;
	
	  ;% rtB.ddiciehpze
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 7;
	
	  ;% rtB.gd1faqqhf2
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 8;
	
	  ;% rtB.jumjq2t40g
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 48;
	
	  ;% rtB.pq4oqj1ftp
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 1000048;
	
	  ;% rtB.n1gggjnnco
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 1000049;
	
	  ;% rtB.pjgcsw34ma
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 1000050;
	
	  ;% rtB.f5eb0air2b
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 1000051;
	
	  ;% rtB.mqse2qzydk
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 1000052;
	
	  ;% rtB.eglqpzmyql
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 1000053;
	
	  ;% rtB.koeh140u5g
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 1000054;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
    sectIdxOffset = 1;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (rtDW)
    ;%
      section.nData     = 10;
      section.data(10)  = dumData; %prealloc
      
	  ;% rtDW.bduzutfccm
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDW.erly5mzpqu
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtDW.hmodxnmmkt
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% rtDW.ob2ec14xe1
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% rtDW.fhpdmjxep0
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 1000003;
	
	  ;% rtDW.ksa3xgmiqj
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 1000004;
	
	  ;% rtDW.okcpqnsmiw
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 1000005;
	
	  ;% rtDW.lbb42b2aei
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 1000006;
	
	  ;% rtDW.hknj5qhj2i
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 1000007;
	
	  ;% rtDW.m1qnoszbqg
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 1000008;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% rtDW.m3nzbucckd.LoggedData
	  section.data(1).logicalSrcIdx = 10;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDW.f20m2zfiki.LoggedData
	  section.data(2).logicalSrcIdx = 11;
	  section.data(2).dtTransOffset = 1;
	
	  ;% rtDW.ekhy4r2klw.LoggedData
	  section.data(3).logicalSrcIdx = 12;
	  section.data(3).dtTransOffset = 2;
	
	  ;% rtDW.af1vwlxkji.LoggedData
	  section.data(4).logicalSrcIdx = 13;
	  section.data(4).dtTransOffset = 4;
	
	  ;% rtDW.ncyke2zkxu.LoggedData
	  section.data(5).logicalSrcIdx = 14;
	  section.data(5).dtTransOffset = 5;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% rtDW.orevitufji
	  section.data(1).logicalSrcIdx = 15;
	  section.data(1).dtTransOffset = 0;
	
	  ;% rtDW.odc1vrxcnj
	  section.data(2).logicalSrcIdx = 16;
	  section.data(2).dtTransOffset = 2;
	
	  ;% rtDW.mub0cybqzq
	  section.data(3).logicalSrcIdx = 17;
	  section.data(3).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% rtDW.psqpiuobuv
	  section.data(1).logicalSrcIdx = 18;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% rtDW.frt1tkd2yf
	  section.data(1).logicalSrcIdx = 19;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(5) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 3470230764;
  targMap.checksum1 = 490784607;
  targMap.checksum2 = 789373833;
  targMap.checksum3 = 339123673;

