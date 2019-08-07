function r_lvlh  = body2xl(r,th_ct,th_it)
% all angles are needed to be in degrees

C_xlit_b = [cosd(th_it) 0 -sind(th_it) ; 0 1 0; sind(th_it) 0 cosd(th_it)];

C_xl_xlit = [1 0 0; 0 cosd(th_ct) sind(th_ct) ; 0 -sind(th_ct) cosd(th_ct)];


r_lvlh = C_xl_xlit*C_xlit_b*r;