
import scipy
from scipy import fftpack
from scipy import signal
from scipy import stats
from modules import scale_spec
import pandas as pd

def mycross(Stim, FFR):
    data = pd.DataFrame()
    cors = []
    lag = []
    for step in range(26 ,60):
        #         print(step)
        lag.append(step)
        f ,t, SSxx = signal.spectrogram(Stim, 1000, noverlap = 76, nperseg =90)
        ff ,ft, FSxx = scale_spec.scale_spec(FFR[ 500 +step: 942 +step])
        mycross = scipy.signal.correlate2d(SSxx ,FSxx, mode = 'valid')
        cors.append(mycross[0][0])
    data['lag'] = lag
    data['cor'] = cors
    return data


