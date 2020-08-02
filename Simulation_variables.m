

% Normal Operation & Emergency Stop Reference
Reference.v_i = [20 25 15 25 0 0];    %initial velocity
Reference.v_e = [25 15 25 0 70/3.6 70/3.6];   %final velocity
Reference.t_start = [25 100 142 200 230 285]; %initial time
Reference.t_end = [Reference.t_start(1)+12 Reference.t_start(2)+22.5 Reference.t_start(3)+20 Reference.t_start(4)+12.5 Reference.t_start(5)+30 Reference.t_start(6)+60];    %final time
Reference.H = (Reference.v_e-Reference.v_i)./(Reference.t_end-Reference.t_start);   %height/acceleration

N = 5; % No of vehicles in the platoon
vehicleL.tau = 0.1; %[s] time constant for the leader
help_pos = 100; %Initial leader position [m]
 
for i=1:N

   % Time gap between vehicles
   controller(i).hp = 0.5; %desired time gap between preceeping vehicles (m)
   controller(i).hl = 0.5; %desired time gap (m)
   
   % PD controller parameters
   controller(i).K1 = 0.038555; %gap regulating controller gains for follower gap regulation
   controller(i).K2 = 12.88408; %gap regulating controller gains for follower vehicle gap regulation
   controller(i).K3 = 1000000; %gap regulating controller gains for leader gap regulation
   controller(i).K4 = 0.005; %gap regulating controller for leader gap regulation
   
   Vehicle(i).delay = 0.2; %Communications delay [s]
   
   % Initial platoon vehicle platoon variables
   %Vehicle(i).tau = 0.2*i*0.75; %Internal vehicle delay for linear driveline dynamics
   Vehicle(i).s0 = help_pos - 75/3.6*controller(i).hp; %Desired time gap between preceeding vehicles
   Vehicle(i).v0 = 75/3.6; %Initial platoon velocity (m/s)
   Vehicle(i).a0 = 0;  %Initial platoon acceleration 
   help_pos = Vehicle(i).s0; %initial vehicle positions in the platoon
end

Err_matrix = [1 -1 0 0 0 0
              0 1 -1 0 0 0
              0 0 1 -1 0 0
              0 0 0 1 -1 0
              0 0 0 0 1 -1]; %matrix outlining mismatch between vehicles
          
          
 Vel_matrix =[1 -1 
    
           
 
 
Param.g = 9.8; % [m/s^2] acceleration due to gravity
Param.rho = 1.225; %[kg/m^3] air density

% Non-linear vehicle model
for i=1:N
Vehicle(i).A  = 2.24;         %[m^2] Front area
Vehicle(i).tau =  0.2*i*0.75;  %[s] internal lag [0.2-0.8] for non-linear driveline
Vehicle(i).l   =  5-i*0.1;          %[m] vehicle length []
Vehicle(i).m   =  1450+i*15;       %[kg]mass [800-1600]
Vehicle(i).eta =  0.92-i*0.01;  %[-] mechanical efficiency of the driveline [0.82-0.92]
Vehicle(i).ca  =  0.38*Vehicle(i).A*Param.rho/2;    %[kg/m] coefficient of the aerodynamic drag [0.2-0.6]
Vehicle(i).r   =  0.34;       %[m] tire radious
Vehicle(i).f   =  0.01;       %[-] coefficient of the rolling resistance

% Desired vehicle torque [Nm]
Vehicle(i).T0 =  Vehicle(i).r ./ Vehicle(i).eta .* (Vehicle(i).a0.* Vehicle(i).m + Vehicle(i).ca .* Vehicle(i).v0.^2 + Vehicle(i).m .* Vehicle(i).f .* Param.g); % Desired vehicle torque[Nm] 

end
vel_pos = [1 0 0]; %position state [m]
vel_vet = [0 1 0]; %velocity state [km/hr]
vel_acc = [0 0 1]; %acceleration state [g]
