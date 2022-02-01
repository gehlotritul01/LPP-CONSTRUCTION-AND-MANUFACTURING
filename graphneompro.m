% Graphical method for lpp construction problem

format short

clc

%Input Parameters


C = [3672000  290700];
A = [2496960  198900;1101600 87210;73440 4590;1 0; -2 1];

b= [14000000; 5600000; 400000; 10; -2];


%Plotting the graph 

y1 = 0:10:100;
x21 = (b(1) - A(1,1).*y1)./A(1,2);
x22 = (b(2) - A(2,1).*y1)./A(2,2);
x23 = (b(3) - A(3,1).*y1)./A(3,2);
x24 = (b(4) - A(4,1).*y1)./A(4,2);
x25 = (b(5) - A(5,1).*y1)./A(5,2);

x21 = max(0,x21);
x22 = max(0,x22);
x23 = max(0,x23);
x24 = max(0,x24);
x25 = max(0,x25);


plot(y1,x21,'r',y1,x22,'k',y1,x23,'b',y1,x24,'g',y1,x25,'m')


xlabel('value of x1')
ylabel('value of x2')

legend('2496960 x1 + 198900 x2 = 14000000','1101600 x1 +87210 x2 =5600000','73440 x1 + 4590 x2 = 400000','x1 +0x2 = 10','-2 x1 + x2 =-2')

grid on

%Find corner point of the axes

cx1 = find(y1==0); %point with the x1 axis

c1 = find(x21==0); %point with the x2 axis

Line1 = [y1(:,[c1 cx1]); x21(:,[c1 cx1])]';

c2 = find(x22==0); %point with the x2 axis

Line2 = [y1(:,[c2 cx1]); x21(:,[c2 cx1])]';

c3 = find(x23==0); %point with the x2 axis

Line3 = [y1(:,[c3 cx1]); x21(:,[c3 cx1])]';

c4 = find(x24==0); %point with the x2 axis

Line4= [y1(:,[c4 cx1]); x21(:,[c4 cx1])]';

c5 = find(x25==0); %point with the x2 axis

Line5 = [y1(:,[c5 cx1]); x21(:,[c5 cx1])]';

corpt = unique([Line1;Line2;Line3;Line4;Line5],'rows')


%find point of intersection

HG =[0;0];

for i=1:size(A,1)
    hg1=A(i,:);
    
    b1=b(i,:);
    
    for j=i+1:size(A,1)
        hg2=A(j,:);
        b2=b(j,:);
        Aa = [hg1;hg2];
        Bb =[b1;b2];
        Xx=Aa\Bb;
        HG=[HG Xx];
    end
   
end

%intersection point

pt= HG';

%write all corner points
allpt =[pt;corpt];
points =unique(allpt,'rows');

%find feasible region
PT= out(points); %constraint
PT= unique(PT,'rows');


%Compute the objective function


for i=1:size(PT,1)
    
    Fx(i,:)=sum(PT(i,:).*C);
    
end

Vert_Fns = [PT Fx];

%find the optimal one

[fxval,indfx] = max(Fx);
  optval =Vert_Fns(indfx,:);
  
  OPTIMAL_BFS = array2table(optval)
  
  