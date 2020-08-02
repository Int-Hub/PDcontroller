%%
figure; 
plot(time,distance,'linewidth', 2) 
grid on
%title('Steady state velocity response of vehicles platoon')
xlabel('time(s)','FontSize',25)
ylabel('distance(m)','FontSize',25)
legend('follower_4/follower_5','follower_3/follower_4','follower_2/follower_3','follower_1/follower_2','leader/follower_1')
%legend('leader/follower_1','follower_1/follower_2','follower_2/follower_3','follower_3/follower_4','follower_4/follower_5')
set(gca,'FontSize',25); 
%%
figure; 
plot(time,acceleration,'linewidth', 2) 
grid on
title('Steady state acceleration response of vehicles platoon')
xlabel('time(s)','FontSize',25)
ylabel('acceleration(g)','FontSize',25)
legend('leader','follower_1','follower_2','follower_3','follower_4','follower_5')
set(gca,'FontSize',25); 

%%
figure; 
plot(distance,'linewidth', 2) 
grid on
title('Required inter-vehicular distance of platoon')
xlabel('time(s)','FontSize',25)
ylabel('distance(m)','FontSize',25)
legend('leader/follower_1','follower_1/follower_2','follower_2/follower_3','follower_3/follower_4','follower_4/follower_5')
set(gca,'FontSize',25); 
%%
figure; 
plot(velocity,'linewidth', 2) 
grid on
%title('Velocity response to vehicle platoon')
xlabel('time(s)','FontSize',25)
ylabel('velocity(km/hr)','FontSize',25)
legend('leader/follower_1','follower_1/follower_2','follower_2/follower_3','follower_3/follower_4','follower_4/follower_5')
set(gca,'FontSize',25); 
%%
figure; 
plot(acceleration,'linewidth', 2) 
grid on
title('Acceleration response of vehicle platoon')
xlabel('time(s)','FontSize',25)
ylabel('acceleration(g)','FontSize',25)
legend('leader','follower_1','follower_2','follower_3','follower_4','follower_5')
set(gca,'FontSize',25); 
%%
figure; 
plot(F2la,'linewidth', 2) 
grid on
%title('Evolution of vehicle velocity adaptive gains follower to leader')
xlabel('time(s)','FontSize',25)
ylabel('Kij(a)','FontSize',25)
legend('follower_1','follower_2','follower_3','follower_4','follower_5')
set(gca,'FontSize',25); 
%%
figure; 
plot(time,'linewidth', 2) 
grid on
title('Evolution of vehicle acceleration adaptive gains follower to leader')
xlabel('time(s)','FontSize',25)
ylabel('aij','FontSize',25)
legend('follower_1','follower_2','follower_3','follower_4','follower_5')
set(gca,'FontSize',25); 
%%
%%
figure; 
plot(pita,'linewidth', 2) 
grid on
%title('Evolution of adaptive all to all topology from follower to follower')
xlabel('time(s)','FontSize',25)
ylabel('aij','FontSize',25)
legend('follower_1','follower_2','follower_3','follower_4','follower_5')
set(gca,'FontSize',25); 
%%
plot(stna)
%%
plot(vara)
%%
plot(meana)
%%
figure
plot(F2ls)
set(gca,'FontSize',25); 
hold on
plot(F2lv)
set(gca,'FontSize',25); 
plot(F2la)
set(gca,'FontSize',25); 
hold off
%%
figure
plot(F2fs)
set(gca,'FontSize',25);
%%
%xlabel('K(1,2)','K(1,3)','K(1,4)','K(1,5)','K(2,1)','K(2,3)','K(2,4)','K(2,5)','K(3,1)','K(3,2)','K(3,4)','K(3,5)','K(4,1)','K(4,2)','K(4,3)','K(4,5)','K(5,1)','K(5,2)','K(5,3)','K(5,4)')
%ylabel(time(s))
%%
set(gca,'FontSize',25); 
hold on
%%
figure
plot(pita)
set(gca,'FontSize',25);
%%
plot(F2fa)
set(gca,'FontSize',25); 
hold off
%%
figure
subplot(3,1,1)
plot(F2fs)
%legend('Mean(?_v')
set(gca,'FontSize',25); 
subplot(3,1,2)
plot(F2fv)
%legend('Standard diviation(?_v')
set(gca,'FontSize',25); 
subplot(3,1,3)
plot(F2fa)
%legend('Variance(?_v')
set(gca,'FontSize',25); 
