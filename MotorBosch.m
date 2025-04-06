 %% Step 1
 Rated_power = 3400;
 Rpm= 852;
 RPS = Rpm/60;
 wm= 2*pi*RPS; %Rated mech speed
 Tout =  Rated_power/wm;
 %% step 2
 nd=0.9; % desired efficiency
 Vd=225; %input dc voltage
 Pin =  Rated_power/nd; %input power
 It = Pin/Vd;  % average terminal current 
 %phsse current and coli current 
 Iphasepeak =It;
 Iphaserms = ((2/3)^(1/2))* Iphasepeak;
 Np=1; %parallel paths
 Icoli =  Iphasepeak/Np;
 %% main
 ks=0.9 ; %slope factor
 kw=1; %winding factor 
 Bav=0.8 %T
 ac= 25 %kA/m;
 G= ks*kw*Bav*ac*pi*pi;
 D2L= Rated_power/(G*RPS*1000);
 ar=2.5 %aspect ratio
 p=10;
 s=12;
 D=(((p*D2L)/(ar*pi))^(1/3))*1000;
 L= (D2L/(D*D))*1000000000;
 %% Stator
 Total_airgapflux = Bav*pi*D*0.001*L; %m/W/b
 fluxunderonepole =  Total_airgapflux /p;
 statortoothflux= Total_airgapflux/s;
 ki=0.9; %iron insulation factor
 Bst =1.6 %T
 wst1=statortoothflux*1000/(Bst*L*ki);
 gammawst=0.9;
 wst2 =gammawst*wst1;
bs0 =2;
hs0 =1;
hs1=0.5; 
bs1=2*((tan(pi/s)*((D/2)+hs0+hs1)) - ((wst1/2)/(cos(pi/s))));
%stator and rotor  width
Bsy=1.4;% Tesla
Bry= 1 ; %Tesla
wry=fluxunderonepole/(L*ki*Bry*2);
wsy=fluxunderonepole/(L*ki*Bsy*2);
%phase back emf
gamma_emf = 0.89;
Eph = gamma_emf*(Vd/2); %phase back emf
%number of effective turns per phase
Ntph = Eph*1000/(ks*kw*Total_airgapflux*2*RPS); %%number of effective turns per phase
m=3;
Ntc=(Ntph*Np*m)/s;
Jsw =5.6;
Casc = Iphaserms /Jsw ;
Caca = Casc*Ntc;
kf =0.69; %slot fill factor
gAca = Caca/kf;
%bs2,hs2
alphas = (2*pi)/s;
%hs2 =0:20;
hs2=13.33;
bs2=2*((tan(alphas/2)*((D/2)+hs0+hs1+hs2)) - ((wst2/2)/(cos(alphas/2))));
hs2_new = (4*gAca)./(bs1+bs2);
%if (hs2==round(hs2_new))
 %   hs2_new1=hs2_new
%end
%plot(hs2_new,bs2);
%% magnetic diameter
flux_concentration_factor=0.9;
kl=0.9;%leakage factor
kr=1.1;% reluctance factor
permians_coeff = 5;
gamma_m =0.9;
wm=gamma_m*wry*1000;
air_gap_lenght =2;
Magnet_lenght =flux_concentration_factor*air_gap_lenght *permians_coeff;
magnet_cross_section_area = wm*L;
airgap_cross_section_area = magnet_cross_section_area*flux_concentration_factor;
Remanence_flux_density =1.2; %T
relative_permeability = 1.05 ;
bg=(relative_permeability*flux_concentration_factor*kl)/(1+kr*(relative_permeability/permians_coeff ));
dm=(bg*relative_permeability*gamma_m*kr*kl*air_gap_lenght )/(kl*air_gap_lenght*(Remanence_flux_density-bg));  %depth of magney
 %%
 OSD = D+hs0+hs1+(2*wsy*1000);