import numpy as np
import matplotlib.pyplot as plt

N = 7
ind = np.arange(N)  # the x locations for the groups
width = 0.27       # the width of the bars

fig = plt.figure()
ax = fig.add_subplot(111)

yvals = [0.04, 1.22, 2.39, 4.97, 8.14, 9.80, 10.55]
rects1 = ax.bar(ind, yvals, width, color='r')
zvals = [0.32, 4.52, 12.16, 21.25, 27.09, 45.47, 34.64]
rects2 = ax.bar(ind+width, zvals, width, color='g')
kvals = [0.06, 3.16, 3.95, 8.20, 11.25, 12.94, 13.35]
rects3 = ax.bar(ind+width*2, kvals, width, color='b')

ax.set_title('Tree Build Times')
ax.set_ylabel('Build Time in seconds')
ax.set_xticks(ind+width)
ax.set_xticklabels( ('Teapot\n6.3k', 'Bunny\n144k', 'Sponza\n226k', 'Room\n533k', 'Dragon\n871k', 'Gallery\n999k', 'Buddha\n1087k') )
ax.legend( (rects1[0], rects2[0], rects3[0]), ('BVH', 'KD', 'Octree (depth 8)') )

def autolabel(rects):
    """Attach a text label above each bar in *rects*, displaying its height."""
    for rect in rects:
        height = rect.get_height()
        ax.annotate('{}'.format(height),
                    xy=(rect.get_x() + rect.get_width() / 2, height),
                    xytext=(0, 3),  # 3 points vertical offset
                    textcoords="offset points",
                    ha='center', va='bottom')

plt.savefig("../plots/build-comparison.png")
