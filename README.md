# Computer Vision Exercises 

These are the exercises proposed during the course [Computer Vision](https://corsi.unige.it/en/off.f/2022/ins/60227?codcla=10635) held at [University of Genova (UniGe), Itlay](https://unige.it/en) in [M.Sc Robotics Engineering](https://corsi.unige.it/en/corsi/10635).  

The folder **Lab-02** focused on the methods to add different types of noise, filters and applying Fourier transformation to the sample image. Using MATLAB appropriate approach is applied on the sample image provided during the lab and the changes are observed with the image.

The folder **Lab-05** focuses on Normalized cross-correlation and Harris corner detection. The NCC focuses on keypoints or corners of the image. Harris corner detection focuses on the corner, edge and plane detection.

For ***Lab-02***, **Image filtering and Fourier Transform** below are requirements to fulfill the motive of the exercise:

* Add Gaussian (standard deviation=20) and salt & pepper (density=20%) noise to the provided images:
<li>display the images, the noisy images, and their histograms.<li>
* Remove the noise by using a moving average, a low-pass Gaussian filter and a median filter:
<li> use two different spatial supports: 3x3 pixels and 7x7 pixels; <li>
<li> display the filters by using imagesc() and surf(); <li>
<li> display the resulting images and their histograms. <li>
* Implement the slides 41-45 “practice with linear filters”:
<li> use filters with a spatial support of 7x7 pixels.<li>
<li> display the filters by using imagesc() and surf();<li>
<li> display the resulting images.<li>
4. Apply the Fourier Transform (FFT) on the provided images:
o display the magnitude (log) of the transformed images;
o display the magnitude of the transformed low-pass Gaussian filter (spatial support of
101x101 pixels with sigma=5);
o display the magnitude of the transformed sharpening filter, slide 44 (the filter has a
spatial support of 7x7 pixels, copy it in the middle of a zeros image of 101x101 pixels).




