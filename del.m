clc
clear all

TRACKS = 2
SEXCIRC = 3
LEVELS = 4
AGES = 41
STATES = 2

% 
% for u = 0:TRACKS-1
%     for a = 0:AGES-1
%         for  k = 0:LEVELS-1
%             for g = 0:SEXCIRC-1
%                 [u, a, k, g, STATES * (AGES * (g * LEVELS + k) + a) + u * (STATES * SEXCIRC * AGES * LEVELS)]
%             end
%         end
%     end
% end

p = [];
i = 1;
for g = 0:SEXCIRC-1
    for k = 0:LEVELS-1
        for a = 0:AGES-1
            for u = 0:TRACKS-1
            %for s = 0:STATES -1
                %[g, k, a, s, STATES * (AGES * (g * LEVELS + k) + a) + s]
                [g, k, a, u, TRACKS * (AGES * (g * LEVELS + k) + a) + u]
               
            end
        end
    end
end