#  Building

In Terminal.app, go to the the folder that DishwasherApp is in and enter:

`pod install`

The TeamId may need to be changed to run the App.

# Third Pary APIs used

The App uses SDWebImage. This is used to download images in the background. This API was used to speed development and also since it appeared this was not an UI Test. Using this API results in a more responsive UI for very little coding.

# Notes

1. Pods are not committed as they can be freely downloaded.
2. A mock object (MockProduct) was used to speed UI Development.

# Assumptions

1. The App is for iPad Air 2 and iPads that share this screen size only. The UICollectionView has the cell sizes hard-coded. This is not best practive. This is done as the instructions are to produce an App that runs on an iPad and no other devices were mentioned.
2. That the focus of this assignment is to show awareness of TDD. The UI is not perfect. If this was for a client I would have spent more time on the UI and made it as the screenshots show. Some UI functions may have been ommitted. Again, this is because I am assuming the focus is on the Development Process rather than the UI Design.

# Problems

1. The image selector in the Detail view can get confused at the size of the scrollview. This can be fixed by explicitly giving the scrollview size when the orientation is changed.
2. Data loading should be done before the page is loaded. A the moment an empty Detail page is shown. This is not a great User Experience.



