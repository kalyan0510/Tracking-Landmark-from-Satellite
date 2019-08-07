function [l,tar,sat,isVisible,ele,CT,IT] = getLinECI(lon,latt,we,re,rs,ws,th,omg,inc,t)
%All angles and angular velocities should be in degrees

longt = (lon+we*t);
tar = [re*cosd(longt)*cosd(latt); re*sind(longt)*cosd(latt); re*sind(latt)];

C_eci_an = [cosd(omg) -sind(omg) 0; sind(omg) cosd(omg) 0; 0 0 1];

C_an_i = [1 0 0; 0 cosd(inc) -sind(inc) ; 0 sind(inc) cosd(inc)];
thst = (th + ws*t);
sat = C_eci_an*C_an_i*[rs*cosd(thst); rs*sind(thst); 0];
l = tar - sat;
ele = radtodeg(acos( dot(l,tar)/(norm(l)*norm(tar)))) - 90;
isVisible = NaN;
if ele>0
    isVisible = true;
end
l_lvlh = eci2lvlh(l,omg,inc,thst);
ul_b = l_lvlh/norm(l_lvlh);

thCT = asind(-ul_b(2));
thIT = atan2d(ul_b(1), ul_b(3));

l_dot_lvlh = [(ws*cosd(th + t*ws)*sind(omg) + ws*sind(th + t*ws)*cosd(inc)*cosd(omg))*(rs*cosd(th + t*ws)*sind(omg) - re*sind(lon + t*we)*cosd(latt) + rs*sind(th + t*ws)*cosd(inc)*cosd(omg)) - (sind(th + t*ws)*cosd(omg) + cosd(th + t*ws)*cosd(inc)*sind(omg))*(rs*ws*sind(th + t*ws)*cosd(omg) - re*we*sind(lon + t*we)*cosd(latt) + rs*ws*cosd(th + t*ws)*cosd(inc)*sind(omg)) - (ws*cosd(th + t*ws)*cosd(omg) - ws*sind(th + t*ws)*cosd(inc)*sind(omg))*(re*cosd(lon + t*we)*cosd(latt) - rs*cosd(th + t*ws)*cosd(omg) + rs*sind(th + t*ws)*cosd(inc)*sind(omg)) - (sind(th + t*ws)*sind(omg) - cosd(th + t*ws)*cosd(inc)*cosd(omg))*(re*we*cosd(lon + t*we)*cosd(latt) + rs*ws*sind(th + t*ws)*sind(omg) - rs*ws*cosd(th + t*ws)*cosd(inc)*cosd(omg)) - rs*ws*cosd(th + t*ws)^2*sind(inc)^2 - ws*sind(th + t*ws)*sind(inc)*(re*sind(latt) - rs*sind(th + t*ws)*sind(inc));
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      cosd(omg)*sind(inc)*(re*we*cosd(lon + t*we)*cosd(latt) + rs*ws*sind(th + t*ws)*sind(omg) - rs*ws*cosd(th + t*ws)*cosd(inc)*cosd(omg)) - sind(inc)*sind(omg)*(rs*ws*sind(th + t*ws)*cosd(omg) - re*we*sind(lon + t*we)*cosd(latt) + rs*ws*cosd(th + t*ws)*cosd(inc)*sind(omg)) + rs*ws*cosd(th + t*ws)*cosd(inc)*sind(inc);
 (ws*sind(th + t*ws)*cosd(omg) + ws*cosd(th + t*ws)*cosd(inc)*sind(omg))*(re*cosd(lon + t*we)*cosd(latt) - rs*cosd(th + t*ws)*cosd(omg) + rs*sind(th + t*ws)*cosd(inc)*sind(omg)) - (cosd(th + t*ws)*cosd(omg) - sind(th + t*ws)*cosd(inc)*sind(omg))*(rs*ws*sind(th + t*ws)*cosd(omg) - re*we*sind(lon + t*we)*cosd(latt) + rs*ws*cosd(th + t*ws)*cosd(inc)*sind(omg)) - (cosd(th + t*ws)*sind(omg) + sind(th + t*ws)*cosd(inc)*cosd(omg))*(re*we*cosd(lon + t*we)*cosd(latt) + rs*ws*sind(th + t*ws)*sind(omg) - rs*ws*cosd(th + t*ws)*cosd(inc)*cosd(omg)) - (ws*sind(th + t*ws)*sind(omg) - ws*cosd(th + t*ws)*cosd(inc)*cosd(omg))*(rs*cosd(th + t*ws)*sind(omg) - re*sind(lon + t*we)*cosd(latt) + rs*sind(th + t*ws)*cosd(inc)*cosd(omg)) - ws*cosd(th + t*ws)*sind(inc)*(re*sind(latt) - rs*sind(th + t*ws)*sind(inc)) + rs*ws*cosd(th + t*ws)*sind(th + t*ws)*sind(inc)^2];


l_dot_xl = body2xl(l_dot_lvlh,thCT,thIT);
%l_dot_xl = l_dot_xl / norm(l_dot_xl);
thCT_dot = - l_dot_xl(2);
thIT_dot =  l_dot_xl(1)/cosd(thCT) + degtorad(we);
thCT_dot= degtorad(thCT_dot);
thIT_dot= degtorad(thIT_dot);

CT = [thCT thCT_dot];
IT = [thIT thIT_dot];

    



