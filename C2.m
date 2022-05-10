% AAA2 stands for MUX2to1_Function_StaticNMOS
 
function ObjVal = C2(BestPosition)      
%% BestPositionrite into input .sp file
            global NFE;
    if isempty(NFE)
        NFE=0;
    end

    NFE=NFE+1;
    
          
           fidIn=fopen('D:\Users\farshid\Documents\MATLAB\C3.sp','r+');
           ach=fread(fidIn);
           pchar=char(ach');
           
           pos=strfind(pchar,'MP1');
           fseek(fidIn,pos+35,'bof');
           fprintf(fidIn,'%5f',BestPosition(1));   
           
           pos=strfind(pchar,'MP2');
           fseek(fidIn,pos+35,'bof');
           fprintf(fidIn,'%5f',BestPosition(2));   
           
           pos=strfind(pchar,'MN1');
           fseek(fidIn,pos+35,'bof');
           fprintf(fidIn,'%5f',BestPosition(3));   
           
           pos=strfind(pchar,'MN2');
           fseek(fidIn,pos+35,'bof');
           fprintf(fidIn,'%5f',BestPosition(4));   
           
          %pos=strfind(pchar,'MP3');
           %fseek(fidIn,pos+35,'bof');
          % fprintf(fidIn,'%5f',BestPosition(5));   
           
           %pos=strfind(pchar,'MP4');
           %fseek(fidIn,pos+35,'bof');
          %fprintf(fidIn,'%5f',BestPosition(6));  
           
           %pos=strfind(pchar,'MN3');
           %fseek(fidIn,pos+35,'bof');
         %fprintf(fidIn,'%5f',BestPosition(7));   
           
         %pos=strfind(pchar,'MN4');
         %fseek(fidIn,pos+35,'bof');
         %fprintf(fidIn,'%5f',BestPosition(8));   
           
           %pos=strfind(pchar,'MP5');
          % fseek(fidIn,pos+35,'bof');
         %  fprintf(fidIn,'%5f',BestPosition(9));   
           
         %  pos=strfind(pchar,'MP6');
          % fseek(fidIn,pos+35,'bof');
         %  fprintf(fidIn,'%5f',BestPosition(10));   
           
         %  pos=strfind(pchar,'MP7');
       %    fseek(fidIn,pos+35,'bof');
         %  fprintf(fidIn,'%5f',BestPosition(11));  
           
         %  pos=strfind(pchar,'MN5');
         %  fseek(fidIn,pos+35,'bof');
      %     fprintf(fidIn,'%5f',BestPosition(12));   
           
       %    pos=strfind(pchar,'MN6');
        %   fseek(fidIn,pos+35,'bof');
       %    fprintf(fidIn,'%5f',BestPosition(13));   
           
           
       %    pos=strfind(pchar,'mn7');
       %    fseek(fidIn,pos+35,'bof');
       %    fprintf(fidIn,'%5f',BestPosition(14)); 
           
           
       %    pos=strfind(pchar,'MP8');
       %    fseek(fidIn,pos+35,'bof');
       %    fprintf(fidIn,'%5f',BestPosition(15));   
          
           
       %     pos=strfind(pchar,'MN8');
       %    fseek(fidIn,pos+35,'bof');
      %     fprintf(fidIn,'%5f',BestPosition(16));   
           
           
       %    pos=strfind(pchar,'MP9');
       %    fseek(fidIn,pos+35,'bof');
       %    fprintf(fidIn,'%5f',BestPosition(17));   
           
           
       %    pos=strfind(pchar,'MPO');
      %     fseek(fidIn,pos+35,'bof');
      %     fprintf(fidIn,'%5f',BestPosition(18));
           
           
       %    pos=strfind(pchar,'MN9');
      %     fseek(fidIn,pos+35,'bof');
      %     fprintf(fidIn,'%5f',BestPosition(19));   
         
           
      %     pos=strfind(pchar,'MND');
        %   fseek(fidIn,pos+35,'bof');
    %      fprintf(fidIn,'%5f',BestPosition(20));   
           
           
       %    pos=strfind(pchar,'MPB1');
       %    fseek(fidIn,pos+35,'bof');
       %    fprintf(fidIn,'%5f',BestPosition(21));
           
        %    pos=strfind(pchar,'MPB2');
        %   fseek(fidIn,pos+35,'bof');
       %    fprintf(fidIn,'%5f',BestPosition(22));
           
       %    pos=strfind(pchar,'MNA1');
      %     fseek(fidIn,pos+35,'bof');
      %     fprintf(fidIn,'%5f',BestPosition(23));
           
       %     pos=strfind(pchar,'MNA2');
      %     fseek(fidIn,pos+35,'bof');
      %     fprintf(fidIn,'%5f',BestPosition(24));
           
        %   pos=strfind(pchar,'MPB3');
     %     fseek(fidIn,pos+35,'bof');
       %    fprintf(fidIn,'%5f',BestPosition(25));
                    
       %    pos=strfind(pchar,'MPB4');
       %    fseek(fidIn,pos+35,'bof');
       %    fprintf(fidIn,'%5f',BestPosition(26));
           
       %    pos=strfind(pchar,'MNA3');
       %    fseek(fidIn,pos+35,'bof');
       %    fprintf(fidIn,'%5f',BestPosition(27));
           
      %     pos=strfind(pchar,'MNA4');
      %     fseek(fidIn,pos+35,'bof');
      %     fprintf(fidIn,'%5f',BestPosition(28));
                          
       
           
           fclose('all');
           
%% run hspice 
            !C:\synopsys\Hspice_D-2010.03-SP1\BIN\hspice.exe  -i D:\Users\farshid\Documents\MATLAB\C3.sp   -o D:\Users\farshid\Documents\MATLAB\C3
            
%% read data from .lis file 
           
           fidout=fopen('D:\Users\farshid\Documents\MATLAB\C3.lis','r+');
           B=fread(fidout);
           so = char(B');       
           
          %  pos=strfind(so,'avgpower');
          %  fseek(fidout,pos(2)+11,'bof');
          % ObjVal=fscanf(fidout,'%f');
          
          %  Good
          pos=strfind(so,'avgpower');
          fseek(fidout,pos(2)+11,'bof');
          ObjVal=fscanf(fidout,'%f');
              
           % pos=strfind(so,'powerdelay');
           %fseek(fidout,pos(2)+13,'bof');
           %ObjVal=fscanf(fidout,'%f');
           
                   
           fclose('all'); 
           
end   
% End of function