This file contains information on much of the code I've produced this summer.

-AdaboostAttempt.m: 
	This function is my second attempt at writing a program that will do some version of Adaboost.

-AllHaarweights.m:
	This function takes a single 24x24 integrated image, and compares it to many different Haar features.
	The results are outputted as a large array which specifies the feature, and gives a number that is the sum
	 of all of the pixels underneath the white secton feature minus the sum of all of the pixels underneath the black section of the feature.

-basicHaarEyes.m: 
	This is one of the first functions I wrote this summer. It attempts to use Haar features to find the eyes on a picture of a face. 
	It is not very general, but it made a nice first attempt at face detection.


-checksum.m: 
	This functions takes two matricies as inputs. It simply adds the matricies, then finds the sum of all the entries of the resulting matrix.


-CombinatorialOracle.m:
	Every once in a while I have a combinatorics problem that requires some computation. I use this scrpit to execute those computations.


-Databoxmaker.m:
	Takes several 24x24 integrated images and creates a 3d array of the images (x), with a vector (y) 
	where y(i) = 1 if x(:,:,i) is a face, and y(i)= 0 if x(:,:,i) is not a face.


-HaarAttempt.m:
	This is one of my early attempts to compare a large number of Haar features to an image. 


-HaarGen.m:
	This function genrates all the information required to specify a Haar feature. This function is used in several of my other scripts.


-Haarweight.m
	This function takes a single Haar feature and compares it to an image. If one is using multiple Haar features, AllHaarweights.m is advisable instead.


-ImportMultipleImages.m:
	This scrpit converts images to 24x24 integrated images and stores them to a folder.

-integralimage.m:
	This scrpit creates an integral image based on an image.

-newWeakclassifier.m:
	My second version of a weak classifier function. The change versus the origional, is that this one evaluates many weak classifiers and outputs them as a vector. 
	This one actually compares the image to a haar feature, unlike weakclassifier3.m

-pixelReplace.m:
	This function replaces some of the pixels of an image with the pixels of a smaller image.

-ViolaJonesattempt.m:
	My first attempt at an Adaboost function. This function is similar to AdaboostAttempt.m, but it only uses a single base Haar feature. 
	AdaboostAttempt.m also takes advantage of more functions I worte, hopefully making it less combersome than ViolaJonesattempt.m.

-weakclassifier.m
	My first attempt at a weak classifier function. It evaluates a single weak classifier, and it does compare the image to the specified Haar feature.

-weakclassifier3.m
	My third version of  a weak classifier function. This one only evaluates a single weak classifier, and it requires that the haar feature already be compared to the image (use AllHaarweights.m).