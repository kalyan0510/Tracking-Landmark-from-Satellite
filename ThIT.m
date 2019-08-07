t = 60*000:60*1:60*200;

%set(gca,'XLim',[-80,80],'YLim',[-80,80]);

for i=1:length(t)
   
    [l,tar,sat,isVisible,ele,thCt,thIt] = getLinECI(-67.94, 53.97,0.004167,6378,7117.24,0.0599,31.69,266.43,72.5,t(i));
    
    X(i) = t(i)/60;
    Y(i) = thIt(1);
    D(i) = thIt(2);
    Dot(i) = isVisible*thIt(2);
    V(i) = isVisible*thIt(1);
    
end
plot(X,Y,X,V, X,D,X,Dot);
legend('th_I_T','th_I_T when sat is Visible','th_I_T dot','th_I_T dot when Visible');
title('Theta Intrack for 200 min');