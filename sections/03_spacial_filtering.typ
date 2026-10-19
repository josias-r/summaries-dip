= Spacial Filtering
== Convolution and Correlation
#rect()[
  with $w$ = kernel, $f$ = input image, $a$ = half width of kernel, $b$ = half height of kernel
  *2D Convolution (spatial filtering)*
  $ (w * f)(x, y) = sum_(s=-a)^(a) sum_(t=-b)^(b) w(s, t) f(x - s, y - t) $
  *2D Correlation*
  $ (w star f)(x, y) = sum_(s=-a)^(a) sum_(t=-b)^(b) w(s, t) f(x + s, y + t) $

  Rotate the correlation kernel $w$ by $180°$ about its center element to convolute.
]
#rect(inset: 0pt)[
  #table(
    columns: (auto, 1fr, 1fr),
    align: (left, center, center),
    table.header([*Property*], [*Convolution*], [*Correlation*]),
    [Commutative], [$f star g = g star f$], [$-$],
    [Associative], [$f star (g star h) = (f star g) star h$], [$-$],
    [Distributive],
    [$f star (g + h) = (f star g) + (f star h)$],
    [$f star.stroked (g + h) = (f star.stroked g) + (f star.stroked h)$],
  )
]
#rect(inset: 1pt)[
  #align(center, image(width: 27em, "/assets/image-20.png"))
]
= Lowpass Filtering (blurring)
== Box Filter
#rect()[
  $ w(s,t) = frac(1, (2a + 1)(2b + 1)) quad quad -a lt.eq s lt.eq a, -b lt.eq t lt.eq b $
]
== Gaussian Filter
#rect()[
  $
    w (s, t) = frac(1, 2 pi sigma^2) e^(- frac(s^2 + t^2, 2 sigma^2)) = frac(1, 2 pi sigma^2) e^(- frac(r^2, 2 sigma^2)) = K e^(- frac(r^2, 2 sigma^2))
  $
  $ r = sqrt(s^2 + t^2) = "distance from center" $
  #stack(
    dir: ltr,
    image(width: 50%, "/assets/image-21.png"),
    image(width: 50%, "/assets/image-22.png"),
  )
  - We usually _normalize_ a kernel, so it sums to 1, and therefore use $K = 1$.
  - The Gaussian filter is _isotropic_ (rotationally symmetric)
  - The Gaussian filter is _seperable_ ($w star f = w_1 star (w_2 star f)$)
  - The only filter which is _isotropic_ and _seperable_ is the Gaussian filter.
]
== Discrete Gaussian Filter
#rect(inset: 1pt)[
  #image("/assets/image-24.png")
]
== Seperable Filters
#rect()[
  - A 2D kernel is seperable if it can be written as the product of two 1D kernels
  - *Box filter*
  - $frac(1, 3) mat(1; 1; 1) dot frac(1, 3) mat(1, 1, 1) = frac(1, 9) mat(1, 1, 1; 1, 1, 1; 1, 1, 1)$
  - *Discrete Gauss filter approximation*
  - $frac(1, 4) mat(1; 2; 1) dot frac(1, 4) mat(1, 2, 1) = frac(1, 16) mat(1, 2, 1; 2, 4, 2; 1, 2, 1)$

  2D convolution can be implemented *as two 1D convolutions* (faster)!

]
== Derivatives
#rect()[

  TODO: CDF / gaussian blur as LOWPASS filter vs HIGHPASS filtering derivatives
  TODO:
  + Highpass/Lowpass filtering
  + first derivative vs second derivative.
  + How to apply derivative on discrete aka image Data.
  + How to apply in 2D = Gradient application
  + Laplace Filter Kernels
  + Unsharp Mask vs Laplace/Derivative


]
