import numpy as np
import pandas as pd
from sklearn.preprocessing import scale
from os.path import join, exists
from os import makedirs
import h5py
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import fftpack
import matplotlib.pyplot as plt
from scipy import signal
import matplotlib.pyplot as plt
from sklearn.preprocessing import normalize
from numpy import linalg as LA
from sklearn.preprocessing import scale
import random
import librosa
from scipy import stats
from scipy.signal import hilbert, chirp
import peakutils
import peakutils
import plotly.graph_objs as go
import h5py
import pandas as pd
import numpy as np
import modules
from scipy import signal
import matplotlib.pyplot as plt
from scipy import interpolate



def scale_spec(mydata):
    ## find the amplitude at each time bin
    myspec = np.fft.rfft(mydata)
    Amps = (np.linspace(0, 500, myspec.shape[0]), abs(myspec))
    plt.plot(abs(myspec))

    ## calculate spec to get freq bin windows
    f, t, Sxx = signal.spectrogram(mydata, 1000, noverlap=76, nperseg=90)

    ## calculate freq bin
    freq_bins = []
    for i in range(len(f)):
        if i == 0:
            ls = list(range(0, int(f[i] + 5)))
            freq_bins.append(ls)
        else:
            ls = list(range(int(f[i] - 5), int(f[i] + 5)))
            freq_bins.append(ls)

    ## calculate the amp
    vals = []
    for t in freq_bins:
        if len(t) > 1:
            last = len(t)
            ind = np.where((Amps[0] > t[0]) & (Amps[0] < t[last - 1]))
            m = np.mean(Amps[1][ind[0]])
            vals.append(m)
        else:
            a = int(t[0])
            vals.append(Amps[1][a])

    ## put in df
    avg_amps = pd.DataFrame()
    avg_amps['bin#'] = list(range(46))
    avg_amps['feq_val'] = vals
    plt.plot(np.linspace(0, 500, avg_amps['feq_val'].shape[0]), avg_amps['feq_val'])
    plt.title('avg vals and Spec')
    # plt.show()

    a, b, Sxx = signal.spectrogram(mydata, 1000, noverlap=76, nperseg=90)

    for f in range(len(vals)):
        for s in range(len(Sxx[f])):
            Sxx[f][s] = Sxx[f][s] / vals[f]

    return a, b, Sxx