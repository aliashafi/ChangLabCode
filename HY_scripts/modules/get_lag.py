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
from sklearn.preprocessing import normalize
from sklearn.preprocessing import scale
import random
import librosa
from scipy import stats
import peakutils
import sklearn
from modules import crosscorr

def get_lags(el, dataStim, cmeta, chg):
    data = pd.DataFrame()
    elecs = [el]
    for e in elecs:
        correlations = []
        stims = []
        lags = []
        elec = []
        for s in dataStim:
            indx = np.where(cmeta['file'] == s[0:6])
            if len(indx[0]) >= 39:
                np.random.shuffle(indx)
                myhg = np.mean(chg[indx[0][0:39], :, e], axis=0)
                cor = crosscorr.mycross(dataStim[s], myhg)
                lag = np.where(cor['cor'] == max(cor['cor']))
                stims.append(s)
                correlations.append(cor['cor'][lag[0][0]])
                lags.append(cor['lag'][lag[0][0]])
                elec.append(e)
            else:
                pass

        data['lag'] = lags
        data['stim'] = stims
        data['correlations'] = correlations
        print('finished with elec: ' + str(el))

        return data
