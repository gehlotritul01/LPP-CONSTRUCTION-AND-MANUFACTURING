% Graphical method for lpp manufacturing problem


format short

clc

%Input Parameters



C = [27  48];
A = [12.5 25; 2 4; 2 4; 3 6; 2.5 5; 2.5 5; 5 10; 2.5 5; 2.5 5; 0.5 1; 15 30; 1 1; 1 3; 1 0; 0 1];

b= [10000; 1500; 1400; 1500; 1350; 1200; 2800; 2600; 1100; 300; 8250; 450; 1000; 400; 200];


%Plotting the graph 

y1 = 0:10:100;
x21 = (b(1) - A(1,1).*y1)./A(1,2);
x22 = (b(2) - A(2,1).*y1)./A(2,2);
x23 = (b(3) - A(3,1).*y1)./A(3,2);
x24 = (b(4) - A(4,1).*y1)./A(4,2);
x25 = (b(5) - A(5,1).*y1)./A(5,2);
x26 = (b(6) - A(6,1).*y1)./A(6,2);
x27 = (b(7) - A(7,1).*y1)./A(7,2);
x28 = (b(8) - A(8,1).*y1)./A(8,2);
x29 = (b(9) - A(9,1).*y1)./A(9,2);
x210 = (b(10) - A(10,1).*y1)./A(10,2);
x211 = (b(11) - A(11,1).*y1)./A(11,2);
x212 = (b(12) - A(12,1).*y1)./A(12,2);
x213 = (b(13) - A(13,1).*y1)./A(13,2);
x214 = (b(14) - A(14,1).*y1)./A(14,2);
x215 = (b(15) - A(15,1).*y1)./A(15,2);

x21=max(0,x21);
x22=max(0,x22);
x23=max(0,x23);
x24=max(0,x24);
x25=max(0,x25);
x26=max(0,x26);
x27=max(0,x27);
x28=max(0,x28);
x29=max(0,x29);
x210=max(0,x210);
x211=max(0,x211);
x212=max(0,x212);
x213=max(0,x213);
x214=max(0,x214);
x215=max(0,x215);


%plotting coloured lines
plot(y1,x21,'r',y1,x22,'g',y1,x23,'b',y1,x24,'c',y1,x25,'m',y1,x26,'y',y1,x27,'k',y1,x28,'w',y1,x29,'r',y1,x210,'g',y1,x211,'b',y1,x212,'c',y1,x213,'m',y1,x214,'y',y1,x215,'k')


xlabel('value of u1')
ylabel('value of u2')

legend('12.50 u1 + 25 u2 ≤ 10000','2 u1 + 4 u2 ≤ 1500','2 u1 + 4 u2 ≤ 1400','3 u1 + 6 u2 ≤ 1500','2.5 u1 + 5 u2 ≤ 1350','2.5 u1 + 5 u2 ≤ 1200','5 u1 + 10 u2 ≤ 2800','2.5 u1 + 5 u2 ≤ 2600','2.5 u1 + 5 u2 ≤ 1100','0.5 u1 + u2 ≤ 300','15 u1 + 30 u2 ≤ 8250','u1 + u2 ≤ 450','u1 + 3 u2 ≤ 1000','u1 ≤ 400','u2 ≤ 200')

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

c6 = find(x26==0); %point with the x2 axis

Line6 = [y1(:,[c6 cx1]); x21(:,[c6 cx1])]';

c7 = find(x27==0); %point with the x2 axis

Line7 = [y1(:,[c7 cx1]); x21(:,[c7 cx1])]';

c8 = find(x28==0); %point with the x2 axis

Line8 = [y1(:,[c8 cx1]); x21(:,[c8 cx1])]';

c9 = find(x29==0); %point with the x2 axis

Line9 = [y1(:,[c9 cx1]); x21(:,[c9 cx1])]';

c10 = find(x210==0); %point with the x2 axis

Line10 = [y1(:,[c10 cx1]); x21(:,[c10 cx1])]';

c11 = find(x211==0); %point with the x2 axis

Line11 = [y1(:,[c11 cx1]); x21(:,[c11 cx1])]';

c12 = find(x212==0); %point with the x2 axis

Line12 = [y1(:,[c12 cx1]); x21(:,[c12 cx1])]';

c13 = find(x213==0); %point with the x2 axis

Line13 = [y1(:,[c13 cx1]); x21(:,[c13 cx1])]';

c14 = find(x214==0); %point with the x2 axis

Line14 = [y1(:,[c14 cx1]); x21(:,[c14 cx1])]';

c15 = find(x25==0); %point with the x2 axis

Line15 = [y1(:,[c15 cx1]); x21(:,[c15 cx1])]';

corpt = unique([Line1;Line2;Line3;Line4;Line5;Line6;Line7;Line8;Line9;Line10;Line11;Line12;Line13;Line14;Line15],'rows')


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
PT= in(points); %constraint
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