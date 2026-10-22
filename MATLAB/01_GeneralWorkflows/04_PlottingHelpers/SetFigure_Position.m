function [  ] = SetFigure_Position( varargin  )
%UNTITLED2 Summary of this function goes here
% 
% Detailed explanation goes here

% 
% SetFigure_Position([1,2,3,4])
% 
% 
% SetFigure_Position(Height=100,Width=300)
% 
% SetFigure_Position('Height',100,'Width',300)



%%

% later return width/height etc
parsed = 0;

% Check if using normal set position array
if(length(varargin) == 1)
    set(gcf,'Position', varargin{1})
    parsed = 1
end

if(parsed == 0)

    position = get(gcf,'Position');

    
    while(length(varargin)==1) %multiple unpacks if needed
       varargin = varargin{1,:};               
    end
    
    optIndex = find(strcmpi('Height',varargin));
    if optIndex > 0
        position(3) = varargin{optIndex+1};
    end
    optIndex = find(strcmpi('Width',varargin));
    if optIndex > 0
        position(4) = varargin{optIndex+1};
    end
    
    set(gcf,'Position', position)
    

end


end

