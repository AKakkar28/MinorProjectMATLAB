clc;
clear all;
a = arduino('COM3','Uno');
for i=1:24
   
x=datetime('now');
v=readVoltage(a,'A1');

fprintf('Date:%s moisture level of the plant is:%f\n',x,v)
if(v>=2.9)                        %v=2.9 is the approx value of moisture level of dry soil
    disp("the plant is thirsty");
    writeDigitalPin(a,'D2',1);
    pause(2); 
    writeDigitalPin(a,'D2',0);
else
    disp("the plant is fine");
end
    pause(12);
    v=readVoltage(a,'A1');
    
     if(v>=2.9)                        %v=2.9 is the approx value of moisture level of dry soil
    disp("the plant is thirsty");
    writeDigitalPin(a,'D2',1);
    pause(2);
    writeDigitalPin(a,'D2',0);
else
    disp("the plant is now fine");
     end
     
     pause(3600);
end
