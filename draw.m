t = 60*0:60*1:60*900;

curve = animatedline('Color','black','LineWidth',1);
curve2 = animatedline('Color','green','LineWidth',2);
curveCT = animatedline('Color','black','LineWidth',1);




xlabel('X');ylabel('Y');zlabel('Z');
[x,y,z] = sphere(25);
r = 6370;
axis equal;
direction = [0 0 1];
set(gca,'XLim',[-8000,8000],'YLim',[-8000,8000],'ZLim',[-8000,8000]);
grid on;
view(52,43);
hold on;
hsu = surf(r*x,r*y,r*z);
plot3([0 10000],[0 0],[0 0],'LineWidth',2,'Color', 'red')
plot3([0 0],[0 10000],[0 0],'LineWidth',2,'Color', 'blue')
plot3([0 0],[0 0],[0 10000],'LineWidth',2,'Color', 'green')
for i=1:length(t)
   
    [l,tar,sat,isVisible,ele,thCt,thIt] = getLinECI(-67.94, 53.97,0.004167,6378,7117.24,0.0599,31.69,266.43,72.5,t(i));
    
    
    rotate(hsu,direction,0.004167*(t(2)-t(1)));

    addpoints(curve,sat(1),sat(2),sat(3));
    
    head  = scatter3(sat(1),sat(2),sat(3),...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor',[0 0 0]);
    head2  = scatter3(tar(1),tar(2),tar(3),'*',...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor',[0 0 0]);
    addpoints(curve2,tar(1),tar(2),tar(3));
   
    
    
    if isVisible ==true
        li = plot3([sat(1) tar(1)],[sat(2) tar(2)],[sat(3) tar(3)],'LineWidth',1,'Color', 'red');
    end
    drawnow
   
    delete(head);
    delete(head2);
    if isVisible ==true
        %delete(li);
    end
    
end

    