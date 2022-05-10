function ObjVal = D2(BestPosition)      
%% BestPositionrite into input .sp file
           
          
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
                  
                         
           fclose('all');
           
%% run hspice 
            !C:\synopsys\Hspice_D-2010.03-SP1\BIN\hspice.exe  -i D:\Users\farshid\Documents\MATLAB\C3.sp   -o D:\Users\farshid\Documents\MATLAB\C3
            
%% read data from .lis file 
           
           fidout=fopen('D:\Users\farshid\Documents\MATLAB\C3.lis','r+');
           B=fread(fidout);
           so = char(B');       
           
           pos=strfind(so,'avgpower');
           fseek(fidout,pos(2)+11,'bof');
           ObjVal=fscanf(fidout,'%f');
              
                   
           fclose('all'); 
           
end   
% End of function