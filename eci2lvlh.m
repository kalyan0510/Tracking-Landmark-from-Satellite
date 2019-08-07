function r_lvlh  = eci2lvlh(r,om,i,th)
% all angles are needed to be in degrees
omg = degtorad(om);
C_an_eci = [cos(omg) sin(omg) 0; -sin(omg) cos(omg) 0; 0 0 1];
in = degtorad(i);
C_ani_an = [1 0 0; 0 cos(in) sin(in) ; 0 -sin(in) cos(in)];
tht = degtorad(th);
C_rtn_ani = [cos(tht) sin(tht) 0; -sin(tht) cos(tht) 0; 0 0 1];
C_lvlh_rtn = [ 0 1 0; 0 0 -1; -1 0 0];

r_lvlh = C_lvlh_rtn*C_rtn_ani*C_ani_an*C_an_eci*r;