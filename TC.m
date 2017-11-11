function u = TC( c, theta, )
% u = u(c,l)
%   
q = c/theta;
q = g + rc;
% w * T = w * Tq + w * Tw + Tl;
% w * Tw = (p^c)*c + (p^q)*q;
T = Tq + Tw + T1/w;
T = (p^c)*c/w + (p^q)*q/w;
Tq = lambda1 * g + (dlambda2 * rc)^2;
T = Tq + Tw + Tl;
% max : u=u(c,l)
% s.t. wT = theta * (g + rc) * (p^c) + (p^g)*(g + rc) + w * Tq + w * Tl;
% L = u(c,l) + lambda2 * (w * T - theta * (g + rc)* p^c - p^g * (g + rc) - w * (p^g * q)^2 - w * Tl )
% L = u(c,l) + lambda3 * (w * T - sanjiao)
% ?L/?g = 0 ¡ú theta * u/lambda2 = theta * p^c + p^q + w * lambda1
% ?L/?rc = 0 ¡ú theta * u/lambda3 = theta * p^c + p^q + 2 * w * lambda2^2 * rc
% ?L/?lambda3 = 0 ¡ú w * T = sanjiao
end

