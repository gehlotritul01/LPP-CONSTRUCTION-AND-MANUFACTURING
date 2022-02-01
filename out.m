function hh=out(X)

%write 1st constraint here  % constraint function for construction problem

x1 = X(:,1);
x2 = X(:,2);

cons1 = 2496960.*x1 + 198900.*x2-14000000 % sign <

h1=find(cons1>0);
X(h1,:)=[];


%write 2nd constraint here

x1 = X(:,1);
x2 = X(:,2);

cons2 = 1101600.*x1 +87210.*x2-5600000  % sign <

h2=find(cons2>0);
X(h2,:)=[];

%write 3rd constraint here

x1 = X(:,1);
x2 = X(:,2);

cons3 = 73440.*x1 + 4590.*x2 - 400000 % sign <

h3=find(cons3>0);
X(h3,:)=[];

%write 4th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons4 = x1 - 10 % sign <

h4=find(cons4>0);
X(h4,:)=[];

%write 5th constraint here

x1 = X(:,1);
x2 = X(:,2);

cons5 = -2.*x1 + x2 -2  % sign <
h5=find(cons5>0);
X(h5,:)=[];


hh=X;
end

