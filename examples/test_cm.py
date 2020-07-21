"""
Script to test the palettes module and provide usage case examples
"""

from matplotlib import pyplot as plt
import scipy.io

from palettes.code import palettes

# 1 -- plot available colourmaps
# palettes.show()


# 2 -- plot data
data=scipy.io.loadmat('test_data.mat')

fig,axs=plt.subplots()
mpl=axs.pcolormesh(data['xx'],data['yy'],data['melt'],cmap=palettes.get_cmap('mellow-rainbow'))
axs.set_axis_off()
fig.colorbar(mpl)
# plt.show()

# 3 -- wave colourmaps
fig,axs=plt.subplots()
pl=axs.pcolormesh(data['xx'],data['yy'],data['albedo'],cmap=palettes.get_cmap('3-wave-yellow-grey-blue'))
axs.set_axis_off()
fig.colorbar(pl)
plt.show()
