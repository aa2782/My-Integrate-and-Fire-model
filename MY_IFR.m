clear
h = 0.1; 
t = 0:h:500;
V = zeros(1,length(t));
V(1) = -60;

H = zeros(1,length(t));
H(floor(100/h):floor(400/h))=1;

Iapp = 2;
El = -60; 
V_th = -50; 
V_reset = -65; 
V_spike = 60; 
Gl = 0.1; 
C = 1; 


for i = 1:length(t)-1
    k1 = (-Gl*(V(i)-El)+ Iapp*H(i))/C; 
    V_new = V(i)+k1*h;
    k2 = (-Gl*(V_new-El)+Iapp*H(i+1))/C;
    V(i+1) = V(i) + (k1+k2)*h/2;
    if V(i+1) >= V_th
       V(i)= 60;
       V(i+1)=V_reset;
    end
end

plot(t, V);
