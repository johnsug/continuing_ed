
# Agero / Signal Processing: 5/04/2018

https://github.com/krsanta/odsc_18_sigproc/blob/master/Signal%20Processing%20Examples%20for%20ODSC%20(May%204%2C%202018%2C%20Final).ipynb

Trying to improve driver safety, prevent accidents before they even happen
driver behavior collected by app / gamification
warns users if:
* excessive speeding
* jamming on breaks too much
* texting while driving

DS model:
----------
inputs:   accelerometer, gyposcope, gps
features: (hard braking, acceleration spike, phone usage)
predict:  accident / driving improvements

signal processing / filtering
---------------------------------
filtering: processing of seperating a time series into different components
* removing unwanted components
* seperating out mixtures into constitunent components (things you want to extract)

eg, start with coffee beans, seperating into grounds (waste) and coffee (desired output)

filtering for time series analysis in mobile telematics:
---------------------------------------------------------
sm = sd + n + b
sm: measured sensor signal (e.g. gyroscope)
sd: desired/ideal signal in the absense of any corruption
n:  noise corruption--electromagnetic interference, high frequency vibration, etc
b:  bias corruption--small, constant offsets in a sensor's measurement output

am = g + ad + n + b
ad: acceleration of phone
g:  gravity vector (used in determining phone orientation)
	- if a phone is sitting still, it still records gravity impacting it

from time series to frequency series
* rather that representing our data as a collection of values at different times, we can equivalenty represent our data as a collectoin of values at different frequencies

estimate the integral using fast fourier transform (FFT) -- well established frequency representation

different filters available in python, including but not limited to:
* butterworth
* chebyshev
* elliptic

Kalman Filters ... complicated structure, but optimal

** ML feature extraction in mobile sensing
* presence of hard breaking... 
- to overcome: sensor fusion (combining methods from different types of sensors)
- primary tool: kalman filter -- a probabilstic approach to combining data from multiple sensors
