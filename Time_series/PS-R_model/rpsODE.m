% Phage resistant phage saturation model ODE

function [ dx ] = rpsODE( t,x,p )

dx = [0;0;0;0];

%-----------Parameters-----------
% susceptible bacteria growth rate
r = p.r;
% resistant bacteria growth rate
rp = p.rp;
% total bacteria carrying capacity
Kc = p.Kc;
% adsorption rate of phage:
phi = p.phi;
% phage density at half saturation
Pc = p.Pc;
% immune response killing rate parameter:
ep = p.ep;
% bacterial conc. at which immune response is half as effective:
Kd = p.Kd;
% burst size of phage:
beta = p.beta;
% decay rate of phage:
w = p.w;
% maximum growth rate of immune response:
a = p.a;
% max capacity of immune response:
Ki = p.Ki;
% conc. of bacteria at which imm resp growth rate is half its maximum:
Kn = p.Kn;
% probability of emergence of phage-resistant mutation per cell division
m = p.m;

B = x(1);
R = x(2);
P = x(3);
I = x(4);

% Change in susceptible bacterial population
dx(1) = (r*B*(1-((B+R)/Kc))*(1-m))-(B*((phi*P)/(1+(P/Pc))))-(ep*I*B/(1+((B+R)/Kd)));
% Change in resistant bacterial population
dx(2) = ((rp*R*(1-((B+R)/Kc)))+r*B*(1-((B+R)/Kc))*m)-(ep*I*R/(1+((B+R)/Kd)));
% Change in phage population
dx(3) = (beta*B*((phi*P)/(1+(P/Pc))))-(w*P);
% Change immune response
dx(4) = a*I*((B+R)/(B+R+Kn))*(1-(I/Ki));

end

