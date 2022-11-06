"""
Tools for manipulating
matplotlib.colors.LinearSegmentedColormap
instances.
"""

import numpy as np
from matplotlib.colors import LinearSegmentedColormap

def join_cmaps(cm1, cm2, N1=128, N2=128, name='Joined Cmap'):
    """Join two LinearSegmentedColormap instances

    Joins colormaps cm1 and cm2 by extracting lists of
    size (N1 x 4) from cm1 and (N2 x 4) from cm2. The
    new LinearSegmented colormap is computed from
    the concanetated arrays with the
    LinearSegmentedColormap.from_list method.

    The first colormap will be squeezed to take up
    a fraction N1 / (N1 + N2) of the resulting map,
    and the second colormap will take up a fraction
    N2 / (N1 + N2). The default N1=N2=128 results
    in equal-fraction colormaps.

    Parameters:
    --------
    cm1 : LinearSegmentedColormap
        First colormap to join.
        e.g., cm1 = palettes.get_cmap([cmap name])
    cm2 : LinearSegmentedColormap
        Second colormap to join
    N1 : int
        Number of samples from first colormap
    N2 : int
        Number of samples from second colormap

    Returns:
    -------
    cm : LinearSegmentedColormap        
    """
    cm1_data = cm1(np.linspace(0, 255, N1).astype(int))
    cm2_data = cm2(np.linspace(0, 255, N2).astype(int))

    cm_data = np.concatenate((cm1_data, cm2_data))
    cm = LinearSegmentedColormap.from_list(name, cm_data)

    return cm
