%code for manufacturing problem

format short 
clear all
clc

%Input parameters 
Noofvariables =2;
C = [27  48];
Info = [12.5  25;2 4;2 4;3 6; 2.5 5;2.5 5;5 10;2.5 5;2.5 5;0.5 1;15 30;1 1;1 3;1 0;0 1];

b= [10000;1500;1400;1500;1350;1200;2800;2600;1100;3000;8250;450;1000;400;200];
s = eye(size(Info,1));

A = [Info s b];

Cost =zeros(1,size(A,2));
Cost(1:Noofvariables)=C;

% Constraint BV
BV= Noofvariables+1:1:size(A,2)-1;

%Calculate zj-cj ROW
ZjCj = Cost(BV)*A-Cost;

%Print the table

ZCj=[ZjCj;A];

SimpTable = array2table(ZCj);
SimpTable.Properties.VariableNames(1:size(ZCj,2))= {'X_1','X_2','S_1','S_2','S_3','S_4','S_5','S_6','S_7','S_8','S_9','S_10','S_11','S_12','S_13','S_14','S_15','Soln'}


%SIMPLEX TABLE START




flag= true;


while flag == true
if any(ZjCj<0)    %Check if any negative value there
    fprintf('The current BFS is not optimal\n')
  fprintf('\n ===========THE NEXT ITERATION RESULTS============ \n')
    
  disp('OLD BASIC VARIABLE (BV) = ');
  disp(BV);
  %Finding the entering variable
  ZC=ZjCj(1:end-1);
  [EnterCol,pvt_col] = min(ZC);
  fprintf('The minimum element in zj-cj row is %d corresonding to column %d\n',EnterCol,pvt_col);
  fprintf('Entering variable is %d \n',pvt_col);
  
  %Finding the leaving variable
  
  sol = A(:,end);
  Column = A(:,pvt_col);
  
  
  if all(Column<=0)
      error('LPP is unbounded ,all entries <=0 in column %d',pvt_col);
  
  else
      
  
  
    for i=1:size(Column,1)
        if Column(i)>0
        ratio(i) = sol(i)./Column(i);
        
        else  
          ratio(i) =inf;
          
        end
      
    end
     %FINDING THE MINIMUM
     [MinRatio,pvt_row] = min(ratio);
     fprintf('Minimum ratio corresponding to PIVOT ROW is %d \n',pvt_row);
     fprintf('Leaving variable is %d \n', BV(pvt_row));
     
     
      
  end
      
  BV(pvt_row) = pvt_col;
  
  disp('New Basic Variables (BV) = ');
  
  disp(BV);
  
  
  %PIVOT KEY
  
  
  pvt_key = A(pvt_row,pvt_col);
  
  
  %Update the table for next iteration
  
  A(pvt_row,:) = A(pvt_row,:)./pvt_key;
  
   for i=1:size(A,1)
       
       
      if i~=pvt_row
         
      A(i,:)=A(i,:)-A(i,pvt_col).*A(pvt_row,:);
         
      
      end
               ZjCj = ZjCj -ZjCj(pvt_col).*A(pvt_row,:);
               
                  
        % Print purpose 

           ZCj=[ZjCj;A];

          SimpleTable = array2table(ZCj);
          SimpTable.Properties.VariableNames(1:size(ZCj,2))= {'X_1','X_2','S_1','S_2','S_3','S_4','S_5','S_6','S_7','S_8','S_9','S_10','S_11','S_12','S_13','S_14','S_15','Soln'}
          
           
           
           
          BFS =zeros(1,size(A,2));
           
           BFS(BV) =A(:,end);
           
          BFS(end) = sum(BFS.*Cost);
            
           Current_BFS = array2table(BFS);
          Current_BFS.Properties.VariableNames(1:size(Current_BFS,2))={'X_1','X_2','S_1','S_2','S_3','S_4','S_5','S_6','S_7','S_8','S_9','S_10','S_11','S_12','S_13','S_14','S_15','Soln'}
         
           
   end
       
       
else       
     flag = false;
           
 
 fprintf(' ============ **************** ============== \n')

 fprintf('The current BFS is optimal \n')
 fprintf(' ============ **************** ============== \n')
   
   
end  
 
           
end
  
    
 
