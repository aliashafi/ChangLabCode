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
from modules import scale_spec
from modules import get_lag
from modules import run_permute

# load the data
datafile = '/userdata/ashafi/UI399_LFP_1kHz.h5'
f = h5py.File(datafile, "r")
hg = f['hg'].value
bad_channels = f['hg'].attrs['bad_channels']
f.close()
meta = pd.read_hdf(datafile)



# to get rid of "bad" trials (just one here)
meta['Trial'] = range(0, meta.shape[0])
good_idx = np.where(meta['HG'])[0]
chg = hg[good_idx, :, :].copy()
cmeta = meta.loc[np.where(meta['HG'])[0]].copy().reset_index(drop = True)



'''this reads each wav file, zero pads it to match the FFR, runs autocorr on all stimuli and then 
    normalizing from -1 to 1'''
import scipy.io
import os

'''autocorr the stimulation wav files t = tone, p = b or h, male or female'''
dirs = os.listdir('/userdata/ashafi/alia_temp_1/stimwav/')
dataStim = pd.DataFrame()
positive = np.zeros((558,))
negative = np.zeros((500,))


for i in dirs:
    y, sr= librosa.load('/Users/alia/Documents/dura/userdata/ashafi/alia_temp_1/stimwav/' + i, sr = 1000)
#     y = np.append(y,positive)
#     y = np.insert(y,0,negative)
    dataStim[i] = y


## add 'file' column in cmeta
cmeta['file'] = np.zeros(len(cmeta))
for l in range(len(cmeta)):
    cmeta['file'][l] = cmeta['syllable'][l] + str(cmeta['tone'][l]) + '-' + cmeta['speaker'][l] + "N"

elecs = list(range(0, 256))
PThresh = pd.DataFrame()
thresh = []
elec = []
stim = []
c = []
z = []
PVal = []
for e in elecs:
    data = get_lag.get_lags(e, dataStim, cmeta, chg)
    print(str(e) + ' is starting')
    for s in dataStim:
        indx = np.where(cmeta['file'] == s[0:6])
        myhg = np.mean(chg[indx[0], :, e], axis=0)
        for d in range(len(data)):
            if data['stim'][d] == s:
                stim.append(s)
                lag = data['lag'][d]
                cors = data['correlations'][d]
                p = run_permute.run_permute(dataStim[s], myhg, lag, 10000)

                t = np.percentile(p, 95)

                p.append(cors)
                zscore = scipy.stats.zscore(p)
                pval = scipy.stats.percentileofscore(p, cors)

                PVal.append(pval)
                z.append(zscore[-1])

                elec.append(e)

                thresh.append(t)
                c.append(cors)


PThresh['elec'] = elec
PThresh['stim'] = stim
PThresh['thresh'] = thresh
PThresh['orig'] = c
PThresh['pval'] = PVal
PThresh['zscore'] = z


PThresh.to_csv('final_data.csv')
