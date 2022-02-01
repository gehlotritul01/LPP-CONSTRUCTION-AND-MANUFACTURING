function hh=in(X)

%write 1st constraint here  % constraint function for manufacturing problem

x1 = X(:,1);
x2 = X(:,2);

cons1 = 12.5.*x1 + 25.*x2-10000 % sign <

h1=find(cons1>0);
X(h1,:)=[];


%write 2nd constraint here

x1 = X(:,1);
x2 = X(:,2);

cons2 = 2.*x1 + 4.*x2-1500  % sign <

h2=find(cons2>0);
X(h2,:)=[];

%write 3rd constraint here

x1 = X(:,1);
x2 = X(:,2);

cons3 = 2.*x1 + 4.*x2 - 1400 % sign <

h3=find(cons3>0);
X(h3,:)=[];

%write 4th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons4 = 3.*x1 + 6.*x2 - 1500 % sign <

h4=find(cons4>0);
X(h4,:)=[];

%write 5th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons5 = 2.5.*x1 + 5.*x2 - 1350  % sign <
h5=find(cons5>0);
X(h5,:)=[];

%write 6th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons6 = 2.5.*x1 + 5.*x2 - 1200  % sign <
h6=find(cons6>0);
X(h6,:)=[];

%write 7th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons7 = 5.*x1 + 10.*x2 - 2800  % sign <
h7=find(cons7>0);
X(h7,:)=[];

%write 8th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons8 = 2.5.*x1 + 5.*x2 - 2600  % sign <
h8=find(cons8>0);
X(h8,:)=[];

%write 9th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons9 = 2.5.*x1 + 5.*x2 - 1100  % sign <
h9=find(cons9>0);
X(h9,:)=[];

%write 10th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons10 = 0.5.*x1 + 1.*x2 - 300  % sign <
h10=find(cons10>0);
X(h10,:)=[];

%write 11th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons11 = 15.*x1 + 30.*x2 - 8250  % sign <
h11=find(cons11>0);
X(h11,:)=[];

%write 12th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons12 = 1.*x1 + 1.*x2 - 450  % sign <
h12=find(cons12>0);
X(h12,:)=[];

%write 13th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons13 = 1.*x1 + 3.*x2 - 1000  % sign <
h13=find(cons13>0);
X(h13,:)=[];

%write 14th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons14 = 1.*x1 - 400  % sign <
h14=find(cons14>0);
X(h14,:)=[];

%write 15th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons15 = 1.*x2 - 400  % sign <
h15=find(cons15>0);
X(h15,:)=[];

hh=X;

end