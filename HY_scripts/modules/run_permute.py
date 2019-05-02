import pandas as pd
import numpy as np
import modules
from scipy import signal
import matplotlib.pyplot as plt
from scipy import interpolate
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
import plotly
plotly.tools.set_credentials_file(username='ashafi', api_key='PxONlbVA45fzeK3YWWb9')
from plotly.offline import iplot, init_notebook_mode
import plotly.plotly as py
import plotly.graph_objs as go
from plotly.tools import FigureFactory as FF
import peakutils
import plotly.graph_objs as go
import matplotlib.pyplot as plt
from sklearn.utils import shuffle
from modules import scale_spec




def run_permute(stim, response, lag, iteration):
    permutes = []
    sf, st, SSxx = signal.spectrogram(stim, 1000, noverlap=76, nperseg=90)
    ff, ft, FSxx = scale_spec.scale_spec(response[500 + lag:942 + lag])
    # plt.subplot(1, 2, 1)
    # # plt.pcolormesh(ft, ff, FSxx, vmax=np.percentile(FSxx.flatten(), 99.9))
    # plt.title('response')
    # plt.subplot(1, 2, 2)
    # # plt.pcolormesh(st, sf, SSxx, vmax=np.percentile(SSxx.flatten(), 99.9))
    # # plt.title('stim')
    # # plt.show()

    for i in range(iteration):
        new_Sxx = shuffle(SSxx)
        mycross = signal.correlate2d(FSxx, new_Sxx, mode='valid')
        permutes.append(mycross[0][0])
    return permutes




