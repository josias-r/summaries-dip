= Morphological Image Processing
== Dilation
#rect()[
  Set A of foreground pixels and a structuring element B (also a set) in $ZZ_2$.

  $ A plus.o B = {z in ZZ_2 | (hat(B))_z inter A != emptyset} $

  In words: Translated reflection of structuring element overlaps with at least one element of A

]
== Erosion
#rect()[
  Set A of foreground pixels and a structuring element B (also a set) in $ZZ_2$.

  $ A minus.o B = {z | (B)_z subset.eq A} $

  In words: The erosion is the set of all points $z$ such that B translated by z is fully contained in A.

]
== Erosion and Dilation are Dual
#rect(inset: 1pt)[
  #image("/assets/image-6.png")
]
== Morphological Opening
#rect()[
  $ A compose B = (A minus.o B) plus.o B $
]
#rect(inset: 1pt)[
  #image("/assets/image-7.png")
]
== Morphological Closing
#rect()[
  $ A bullet B = (A plus.o B) minus.o B $
]
#rect(inset: 1pt)[
  #image("/assets/image-8.png")
]
== Opening and Closing
#rect()[
  In practice we apply both, opening and closing, to remove noise from an image.

  Why? First apply opening (erosion followed by dilation) this removes small objects and noise, but introduces small holes in the remaining objects.

  To connect these small holes, we apply closing (dilation followed by erosion) which fills back in the holes, without reintroducing the noise.
]
== Hit-or-Miss Transform
#rect()[
  $ A convolve.o B = (A minus.o B_1) inter (A^c minus.o B_2) $
]
#rect(inset: 1pt)[
  #image("/assets/image-9.png")
]
== Boundary Extraction
#rect()[
  $ beta(A) = A minus (A minus.o B) $
]
#rect(inset: 1pt)[
  #image("/assets/image-10.png")
]
== Region/Hole Filling
#rect(inset: 1pt)[
  #image("/assets/image-11.png")
]
== Connected Component Extraction
#rect(inset: 1pt)[
  #image("/assets/image-12.png")
]
