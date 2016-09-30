function [tout,yout]=myeuler(F,tspan,y0,h,varargin)
% MYRK4 Classical fourth-order Runge-Kutta.
% Usage is the same as ODE23TX 
% except the 4th argument is a fixed step size h.
rtol = 1.e-3;
atol = 1.e-6;
plotfun = @odeplot;
 
t0 = tspan(1);
tfinal = tspan(2);
tdir = sign(tfinal - t0);
plotit = (nargout == 0);
 
t = t0;
y = y0(:);
 
% Initialize output.
 
if plotit
   plotfun(tspan,y,'init');
else
   tout = t;
   yout = y.';
end
s1 = F(t, y, varargin{:});
 
% The main loop.
 
while t ~= tfinal
  
   if 1.1*abs(h) >= abs(tfinal-t)
       h=tfinal-t;
   end
   t = t + h;
   y = y + h*F(t, y);
      if plotit
         if plotfun(t,y,'');
            break
         end
      else
         tout(end+1,1) = t;
         yout(end+1,:) = y.';
      end
end
if plotit
   plotfun([],[],'done');
end

