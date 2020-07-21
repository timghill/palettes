function colourmap=cm_xml_to_matlab(varargin)
% cm_xml_to_matlab.m reads xml files downloaded from SciVisColor
% (https://sciviscolor.org/home/colormaps/) to matlab arrays to use as
% colourmaps for figures.
% Usage:
% cmap=cm_xml_to_matlab(name) returns a 256 x 3 array of R,G,B columns to
%     use with Matlab colormap(cmap) function
% cmap=cm_xml_to_matlab(name, N) specifies the number of colour levels to
%     use
if isempty(varargin)
    plot_all_colourmaps
    return
elseif length(varargin)==1
    name=char(varargin{1});
    N_levels=256;
elseif length(varargin)==2
    name=char(varargin{1});
    N_levels=varargin{2}; 
else
    error('Expected 0, 1, or 2 arguments')
end


% which(cm_xml_to_matlab)
p=mfilename('fullpath');
path=fileparts(p);
path_parts=split(path,'/');
path=join(path_parts(1:end-1),'/');
path=[path{1} '/cmaps'];
% path='..';

% Assumes files exist in this directory with the given name + '.xml'
flip=false;
if strcmp(name(1),'-')
    flip=true;
    name=name(2:end);
end
file_name=[path,'/',name,'.xml'];

if ~isfile(file_name)
    error('Colourmap "%s" does not exist',name)
end
    

% Parse the XML file, finding all "Points"
cmap_data=xmlread(file_name);
all_points=cmap_data.getElementsByTagName('Point');

n_points=all_points.getLength;

RGB=zeros(n_points,3);
x=zeros(n_points,1);
for ii=1:n_points
    this_item=all_points.item(ii-1);
    
    r=str2double(this_item.getAttribute('r'));
    g=str2double(this_item.getAttribute('g'));
    b=str2double(this_item.getAttribute('b'));
    RGB(ii,:)=[r,g,b];
    
    x(ii)=str2double(this_item.getAttribute('x'));
end

% Now interpolate data onto the requested grid
x_new=linspace(0,1,N_levels)';

[c,ia,~]=unique(x);
RGB=RGB(ia,:);
x=c;
% try
R=interp1(x,RGB(:,1),x_new);
G=interp1(x,RGB(:,2),x_new);
B=interp1(x,RGB(:,3),x_new);
% catch
%     x
% end

colourmap=[R,G,B];

if flip
    colourmap=flipud(colourmap);
end
