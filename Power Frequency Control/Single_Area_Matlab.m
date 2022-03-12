% Analysis of single area without frequency control
%
% system data
tt=0.5;  tg=0.1;  tp=20;
kt=1;    kg=1;    kp=100;
r=2;
% specify time array from 0 to 10 seconds in 0.1 second steps
t=[0:0.1:10];
[m,n]=size(t);
%  sx= Ax + Bu
%  y= Cx + Du

% initialise the matrices 
A=zeros(3,3);   B=zeros(3,1);  C=zeros(1,3);   

% specify the A, B, C and D matrices

A(1,1)=-1/tp;      A(1,3)=kp/tp;  
A(2,1)=-kg/(tg*r);  A(2,2)=-1/tg; 
A(3,2)=kt/tt;  A(3,3)=-1/tt;

B(1,1)=(-kp/tp);

C=zeros(1,3);  C(1,1)=1;

D(1,1)=0;

%define input demand change

u=ones(1,n)*(-0.05);

% calculate the response to change in input
y=lsim(A,B,C,D,u,t);

% plot the response and label
figure(1);
plot(t,y);
xlabel('time,seconds');
ylabel('change in frequency, Hz');





