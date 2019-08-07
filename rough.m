l_dot_lvlh = [(ws*cosd(th + t*ws)*sind(omg) + ws*sind(th + t*ws)*cosd(inc)*cosd(omg))*(rs*cosd(th + t*ws)*sind(omg) - re*sind(lon + t*we)*cosd(latt) + rs*sind(th + t*ws)*cosd(inc)*cosd(omg)) - (sind(th + t*ws)*cosd(omg) + cosd(th + t*ws)*cosd(inc)*sind(omg))*(rs*ws*sind(th + t*ws)*cosd(omg) - re*we*sind(lon + t*we)*cosd(latt) + rs*ws*cosd(th + t*ws)*cosd(inc)*sind(omg)) - (ws*cosd(th + t*ws)*cosd(omg) - ws*sind(th + t*ws)*cosd(inc)*sind(omg))*(re*cosd(lon + t*we)*cosd(latt) - rs*cosd(th + t*ws)*cosd(omg) + rs*sind(th + t*ws)*cosd(inc)*sind(omg)) - (sind(th + t*ws)*sind(omg) - cosd(th + t*ws)*cosd(inc)*cosd(omg))*(re*we*cosd(lon + t*we)*cosd(latt) + rs*ws*sind(th + t*ws)*sind(omg) - rs*ws*cosd(th + t*ws)*cosd(inc)*cosd(omg)) - rs*ws*cosd(th + t*ws)^2*sind(inc)^2 - ws*sind(th + t*ws)*sind(inc)*(re*sind(latt) - rs*sind(th + t*ws)*sind(inc));
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      cosd(omg)*sind(inc)*(re*we*cosd(lon + t*we)*cosd(latt) + rs*ws*sind(th + t*ws)*sind(omg) - rs*ws*cosd(th + t*ws)*cosd(inc)*cosd(omg)) - sind(inc)*sind(omg)*(rs*ws*sind(th + t*ws)*cosd(omg) - re*we*sind(lon + t*we)*cosd(latt) + rs*ws*cosd(th + t*ws)*cosd(inc)*sind(omg)) + rs*ws*cosd(th + t*ws)*cosd(inc)*sind(inc);
 (ws*sind(th + t*ws)*cosd(omg) + ws*cosd(th + t*ws)*cosd(inc)*sind(omg))*(re*cosd(lon + t*we)*cosd(latt) - rs*cosd(th + t*ws)*cosd(omg) + rs*sind(th + t*ws)*cosd(inc)*sind(omg)) - (cosd(th + t*ws)*cosd(omg) - sind(th + t*ws)*cosd(inc)*sind(omg))*(rs*ws*sind(th + t*ws)*cosd(omg) - re*we*sind(lon + t*we)*cosd(latt) + rs*ws*cosd(th + t*ws)*cosd(inc)*sind(omg)) - (cosd(th + t*ws)*sind(omg) + sind(th + t*ws)*cosd(inc)*cosd(omg))*(re*we*cosd(lon + t*we)*cosd(latt) + rs*ws*sind(th + t*ws)*sind(omg) - rs*ws*cosd(th + t*ws)*cosd(inc)*cosd(omg)) - (ws*sind(th + t*ws)*sind(omg) - ws*cosd(th + t*ws)*cosd(inc)*cosd(omg))*(rs*cosd(th + t*ws)*sind(omg) - re*sind(lon + t*we)*cosd(latt) + rs*sind(th + t*ws)*cosd(inc)*cosd(omg)) - ws*cosd(th + t*ws)*sind(inc)*(re*sind(latt) - rs*sind(th + t*ws)*sind(inc)) + rs*ws*cosd(th + t*ws)*sind(th + t*ws)*sind(inc)^2];




















3









C = [ - sin(th + t*ws)*cos(omg) - cos(th + t*ws)*cos(inc)*sin(omg),   cos(th + t*ws)*cos(inc)*cos(omg) - sin(th + t*ws)*sin(omg),  cos(th + t*ws)*sin(inc);
                                           -sin(inc)*sin(omg),                                            cos(omg)*sin(inc),                -cos(inc);
   sin(th + t*ws)*cos(inc)*sin(omg) - cos(th + t*ws)*cos(omg), -cos(th + t*ws)*sin(omg) - sin(th + t*ws)*cos(inc)*cos(omg), -sin(th + t*ws)*sin(inc)]










2






syms omg inc ws t th rs omg lon we latt re

C = [ - sin(th + t*ws)*cos(omg) - cos(th + t*ws)*cos(inc)*sin(omg),   cos(th + t*ws)*cos(inc)*cos(omg) - sin(th + t*ws)*sin(omg),  cos(th + t*ws)*sin(inc);
                                           -sin(inc)*sin(omg),                                            cos(omg)*sin(inc),                -cos(inc);
   sin(th + t*ws)*cos(inc)*sin(omg) - cos(th + t*ws)*cos(omg), -cos(th + t*ws)*sin(omg) - sin(th + t*ws)*cos(inc)*cos(omg), -sin(th + t*ws)*sin(inc)]


longt = (lon+we*t);
tar = [re*cos(longt)*cos(latt); re*sin(longt)*cos(latt); re*sin(latt)];

C_eci_an = [cos(omg) -sin(omg) 0; sin(omg) cos(omg) 0; 0 0 1];

C_an_i = [1 0 0; 0 cos(inc) -sin(inc) ; 0 sin(inc) cos(inc)];
thst = (th + ws*t);
sat = C_eci_an*C_an_i*[rs*cos(thst); rs*sin(thst); 0];
l = tar - sat;







