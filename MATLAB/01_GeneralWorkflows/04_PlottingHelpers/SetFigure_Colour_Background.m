function [  ] = SetFigure_Colour_Background( colour  )
%UNTITLED2 Summary of this function goes here
% 
% Detailed explanation goes here

    if(ischar(colour))
        if(strcmp(colour, 'ARNGIN_Template'))
            colour = [246/255,246/255,246/255];
        end
        if(strcmp(colour, 'CWI_Template'))
            colour = [255/255,255/255,255/255]; % White
        end
    end

    set(gcf,'Color',colour)
    
end

