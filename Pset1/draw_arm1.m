function draw_arm1()
fig=figure;  ax=gca;
set (fig, 'WindowButtonMotionFcn', @(obj,event)mousemovedetected());   % This will be main function.
% It handles reading the current mouse position whenever movement is detected, and then redrawing the screen based on the detected position

L=1.2;
redline  = plot([0 0],[1 0],'r','linewidth',7); hold on;  %create the red/blue lines that will be continuously repositioned based on the mouse cursor
blueline = plot([0 0],[1 0],'b','linewidth',5);
xlim([-3 3]); ylim([-3 3]);
xlabel('x-position')
ylabel('y-position')

    function mousemovedetected()
        if overaxis(ax)
            C = get (ax, 'CurrentPoint'); 
            xy = C(1,1:2);
            phi = atan2(xy(2),xy(1));
            th1 = phi - acos((L^2-L^2+xy(2)^2+xy(1)^2)/(2*L*sqrt(xy(2)^2 + xy(1)^2)));
            th2 = pi + phi - acos((L^2+L^2-xy(2)^2-xy(1)^2)/(2*L*L));
            set(redline, 'xdata',[0 L*cos(th1)]); %reposition the red line to be 1.2 units long pointing the dir of the cursor
            set(redline, 'ydata',[0 L*sin(th1)]);
            set(blueline,'xdata',[L*cos(th1) L*cos(th1)+L*cos(th2)]); %reposition the blue line to be a vertical line from the cursor to the x-axis
            set(blueline,'ydata',[L*sin(th1) L*sin(th1)+L*sin(th2)]);
        end %end the if statement
    end %end the mousemovedetected function

    function z = overaxis(ax)   %note that this nested so it can
        % determines whether the cursor is over the specified axis ax
        C = get (ax, 'CurrentPoint'); Cx=C(1,1); Cy=C(1,2);
        z = (Cx>ax.XLim(1)) & (Cx<ax.XLim(2)) & (Cy>ax.YLim(1)) & (Cy<ax.YLim(2));
    end %end the overaxis function
end
