"""
palettes.py is a simple wrapper to the script cm_xml_to_matplotlib.py
(https://sciviscolor.org/matlab-matplotlib-pv44/) to get a
colourmap from the name of the colourmap (e.g. 'mellow-rainbow')
instead of the full file path to the xml file.
"""

import os
import math
import numpy as np

from matplotlib import pyplot as plt

from . import cm_xml_to_matplotlib as cm


def get_cmap(name):
    
    this_path=os.path.abspath(__file__)
    
    db_path=os.path.normpath(os.path.join(this_path,'../../cmaps/'))

    cmap_path=os.path.join(db_path, name + '.xml')
    print(cmap_path)
    if not os.path.exists(cmap_path):
        raise ValueError('Colourmap "%s" does not exist' % name)

    cmap=cm.make_cmap(cmap_path)
    return cmap

def show():
    fig=plt.figure()
    db_path=os.path.normpath(os.path.join(os.path.abspath(__file__),'../../cmaps/'))
    cmap_files=sorted(os.listdir(db_path))

    all_cmap_paths=[f for f in cmap_files if os.path.splitext(f)[-1]=='.xml']

    fig,axs=plt.subplots(math.ceil(len(all_cmap_paths)/3),3)
    all_axs=axs.flatten()

    cdata=np.repeat([np.linspace(0,1,129)],10,axis=0)
    x=np.linspace(0,1,129)
    y=np.linspace(0,1,10)
    xx,yy=np.meshgrid(x,y)

    for ii in range(len(all_cmap_paths)):
        cmap_name=os.path.splitext(os.path.split(all_cmap_paths[ii])[-1])[0]
        
        all_axs[ii].imshow(cdata,cmap=get_cmap(cmap_name))
        all_axs[ii].set_axis_off()

        all_axs[ii].text(0.5,0.5,cmap_name,transform=all_axs[ii].transAxes,horizontalalignment='center',verticalalignment='center')

    plt.show()


if __name__ == '__main__':
    show()

