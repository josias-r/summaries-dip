= Local Features
== Feature Detection
=== Harris Corner Detector
#rect()[
  - Localization of _Landmarks_
  - Stereo Vision
]
#rect(inset: 1pt)[
  #v(0.5em)
  $ C(Delta x, Delta y) = sum_(u in W) sum_(v in W) w(u, v) dot (f(u, v) - f(u + Delta x, v + Delta y))^2 $
  #v(0.5em)
  #image("/assets/image-36.png")
]
#rect()[
  TODO: taylor approximation math
]
=== SIFT (Scale Invariant Feature Transform)
#rect()[
  - Difference of Gaussian (DoG) to detect sizes in image
  + Generate multiple blur levels and take the difference between neighboring levels
  + Subsample the levels and repeat the process to generate a pyramid of images
  - Blob keypoints are detected as local extrema in the DoG pyramid
  - TODO: angle histogram?
  - TODO: orientation independence?
  - TODO: representation and feature vector
]
== Feature Matching
#rect()[
  - TODO: feature matching
  - EXAM NOTE: Exercise week 11 task 1 was an exam question
]
