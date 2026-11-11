= Feature Extraction
== Descriptors
#rect()[
  Object recognition on 4 main propertiies
  + *completeness*: two objects are equal when all features are _equal_
  + *congruence*: two objects are similar when all featrues are _similar_
  + *invariance*: independe of position, rotation, translation, scaling
  + *compactness*: effiecient description of essential properties of objects
]
== Boundary Following (Tracing)
#rect(inset: 1pt)[
  #image("/assets/image-30.png")
]
== Chain Codes
#rect()[
  - lossless compression teqchnique for object in a binary image
  - seperately encode connected components in the image
  - for a region: start point on boundary (sorted list of pixels)
    - encode by saving direction to move to next adjacenet boundary pixel in list
  - Start point normalization (7756442221 → 1775644222):
    - treat code as a circular list, choose starting point deterministically (minimal magnitude)
  - Rotation normalization (1775644222 → 606160600):
    - instead of absoute direction, use relative direction "counts"

  #image("/assets/image-31.png")
]

== Signatures
#rect()[
  - *one-dimensional* representation of a boundary (easier to describe then 2D)
  - may be generated in various ways:
    - reference point -> taking distance to it for every boundary pixel
]
#rect(inset: 1pt)[
  #image("/assets/image-32.png")
  - Normalize: Rotation -> Max at 0; Scale -> Max = 1 factor
]
== Simple Descriptors
#rect()[
  *Simple shape descriptors are based on*
  - the area of an object
  - the length of the perimeter
  - minimum and maximum diameter
  - area of bounding rectangle

  *The Descriptors are*
  - independent of
    - translation
    - scale
    - rotation
  - are easy to compute

]
#rect(inset: 1pt)[
  #image("/assets/image-33.png")
]
#rect(inset: 1pt)[
  #image("/assets/image-34.png")
]
#rect(inset: 1pt)[
  #image("/assets/image-35.png")
]
== Area based Descriptors
== Moments
#rect()[

  + TODO: valdiate and understand
  - Moments are a set of scalars that provide information about the shape of an object
  - The moments of a 2D function f(x,y) are defined as:
    - $m_{"pq"} = ∑∑ x^p y^q f(x,y)$
    - where p and q are non-negative integers
  - The zeroth moment $m_{00}$ is the area of the object
  - The first moments $m_{10}$ and $m_{01}$ are the coordinates of the centroid
  - The second moments $m_{20}$, $m_{02}$, and $m_{11}$ provide information about the orientation and shape of the object
  - The central moments $\mu_{"pq"}$ are defined as:
    - $\mu_{"pq"} = ∑∑ (x - x̄)^p$
]
== Texture Descriptors
#rect()[
  + TODO: statistical moment
  + TODO: what is a texture?
  + TODO: co-occurance matrix
]
