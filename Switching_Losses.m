%% main motor
D=0.6 ; % duty cycle
FSW= 8000 ; %switching frequency
Vin = 200;
I= 70 ; 
Rds= 0.025
Pcond = I*I*Rds*(D^(1/2));
ton = 105*(10^-9) ;
Eon = I*Vin*ton*0.5;
Pon = Eon*FSW;
toff=155*(10^-9);
Eoff=I*Vin*toff*0.5;
Poff= Eoff*FSW;
Ploss = (Pon+Poff+Pcond);
%% Hub Motor 
D=0.6 ; % duty cycle
FSW= 3000 ; %switching frequency
Vin = 200;
I= 10 ; 
Rds= 0.182
Pcond = I*I*Rds*(D^(1/2));
ton = 25*(10^-9) ;
Eon = I*Vin*ton*0.5;
Pon = Eon*FSW;
toff=40*(10^-9);
Eoff=I*Vin*toff*0.5;
Poff= Eoff*FSW;
Ploss = (Pon+Poff+Pcond);



