% clc;
% clear
% close all
% x=openmat('C:\Users\admin\Desktop\sample\s6s2tr.mat');

clearvars -except x ;
th=20; % trash hold
st=100000; % stap data trash hold


f=x.force(1).Force';
% f(:,2)=f(:,2)*-1;


for i= 1:length(f)
    
    if f(i,3)<th
        f(i,3)=0;        
    end
    
end



f_n=0;

for i= 1:length(f)
    
    
    if f(i,3)~=0 %%%%%%%%%%%%%%%%%%%%%%%%%%%%% start
     
        if f_n == 0
           
            if exist('f_e')
                f_e(end+1,1:2)=[i,0];
            else
                f_e=[i,0];
            end
            
        end
        
        f_n = f_n+f(i,3);
        
    else %%%%%%%%%%%%%%%%%%%%%%%%%%%%% end
        
        if f_n > st             
            f_e(end,2)=i;
        elseif f_n > 0             
             f_e(end,:)=[];
        end
        
        f_n=0;
        
    end
    
end

% for i=1:length(f_e)
for i=1:10
    figure
    plot(f(f_e(i,1):f_e(i,2),1:3))
    hold on
    
    plot([0,length(f_e(i,1):f_e(i,2))],[0,0])
    
    hold off
end