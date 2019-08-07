clc;
t = 0:60*1:60*200;



for i=1:length(t)
   
    [l,tar,sat,isVisible,ele,thCt,thIt] = getLinECI(-67.94, 53.97,0.004167,6378,7117.24,0.0599,31.69,266.43,72.5,t(i));
    
    X(i) = t(i)/60;
    Y(i) = thCt(1);
    
    Dot(i) = isVisible*thCt(2);
    D(i) = thCt(2);
    V(i) = isVisible*thCt(1);
    
end
plot(X,Y,X,V, X,D,X,Dot);
legend('th_C_T','th_C_T when sat is Visible','th_C_T dot','th_C_T dot when Visible');
title('Theta Cross track for 200 min');