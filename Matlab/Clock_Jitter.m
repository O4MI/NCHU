% Aperture uncertainty
clear
clc
%% SNR versus Fin with different jitter
jitter = [1e-9 1e-10 1e-11 1e-12 1e-13 1e-14]; %sigma(t)
fin = linspace(1e6,1e10,1e6);
for i=1:size(jitter,2)
    SNR(i,:) = 20*log10(1./(2*pi*fin*jitter(i)));
end
%% Plot 
clf
semilogx(fin,SNR(6,:),'Displayname',' jitter = 10fs','color','b','LineWidth',2);
hold on
semilogx(fin,SNR(5,:),'Displayname',' jitter = 100fs','color','r','LineWidth',2);
semilogx(fin,SNR(4,:),'Displayname',' jitter = 1ps','color','k','LineWidth',2);
semilogx(fin,SNR(3,:),'Displayname',' jitter = 10ps','color','g','LineWidth',2);
semilogx(fin,SNR(2,:),'Displayname',' jitter = 100ps','color','c','LineWidth',2);
semilogx(fin,SNR(1,:),'Displayname',' jitter = 1ns','color','m','LineWidth',2);
legend('location','northeast','FontSize',12);
xlabel('Frequency(Hz)');
ylim([20 100]);
ylabel('SNR(dB)');
grid on
