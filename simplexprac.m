%simplex method using B inverse method
%construction&manufacturing problem2

%Max Z= -2x1 + 3x2- 4x3
%constraints
% 2x1-x2+2x3<=10,-2x1+6x2<=13,-4x1+5x2+7x3<=15
%x1,x2,x3>=10

%submitted by RITUL 2K20/EE/221

format short 
clear all clc


%INPUT PHASE 

Variables ={'x1','x2','x3','s1','s2','s3','sol'};

Cost = [ -2 3 -4 0 0 0 0];
Info = [2 -1 2;-2 6 0;-4 5 7];
b=[10;13;15];
s=eye(size(Info,1));
A=[Info s b];

%Finding starting BFS
BV=[];

for j=1:size(s,2)
    for i=1:size(A,2)
        if A(:,i)==s(:,j)
            BV= [BV i];
        end
    end
end


%%Compute value of Table
B= A(:,BV);
A=inv(B)*A;
ZjCj= Cost(BV)*A-Cost;


%Print table

ZCj =[ZjCj;A];
SimpTable=array2table(ZCj);
SimpTable.Properties.VariableNames(1:size(ZCj,2))=Variables

%Simplex Method Start

Run =true;
while Run==true

ZC= ZjCj(:,1:end-1);
if any(ZC<0);
    fprintf("The current BFS is Not optimal\n");
    %Finding the entering variable

[Entval,pvt_col]=min(ZC);
fprintf("Entering column =%d\n",pvt_col);

%Finding the leaving variable

sol=A(:,end);
Column=A(:,pvt_col);
Har=find(Column>0);
ratio=inf.*ones(1,length(sol));
ratio(Har)=sol(Har)./Column(Har);
[minR,pvt_row]=min(ratio);
fprintf("leaving row=%d \n",pvt_row);


%Update the BV
BV(pvt_row)=pvt_col;
%Update the next table iteration
B=A(:,BV);
A= inv(B)*A;
ZjCj= Cost(BV)*A-Cost;
%Print table
ZCj =[ZjCj;A];
Table=array2table(ZCj);
Table.Properties.VariableNames(1:size(ZCj,2))=Variables

else
    Run=false;
    fprintf("Current BFS is optimal\n");
end 
end

%Final optimal solution print

FINAL_BFS=zeros(1,size(A,2));

FINAL_BFS(BV)=A(:,end);
FINAL_BFS(end)=sum(FINAL_BFS.*Cost); %store BFS
OptimalBFS=array2table(FINAL_BFS); %compute  Z
OptimalBFS.Properties.VariableNames(1:size(OptimalBFS,2))=Variables

    
