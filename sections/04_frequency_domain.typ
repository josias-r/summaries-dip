= Frequency Domain Image Processing
== Frequeny Domain filtering computation
#rect()[
  *Spatial Domain Filtering*
  $ O_"spatial" = M N m n $

  *Frequency Domain Filtering*
  $ O_"freq" = 2 M N log_2(M N) $

  *Legend:*
  - $M times N$ — image size
  - $m times n$ — kernel size
  - $log_2(M N)$ — FFT factor (forward + inverse $-> 2 times$)

  *Square images comparison:*
  $ C_n (m) = frac(M^2 m^2, 2 M^2 log_2 M^2) = frac(m^2, 4 log_2 M) $

  $ C_s (m) = frac(2 M^2 m, 2 M^2 log_2 M^2) = frac(m, 2 log_2 M) $
  #image("/assets/image-27.png")
]
#rect(inset: 1pt)[
  #image("/assets/image-1.png")
]
#rect()[
  *Furier*: Any _periodic_ function can be decomposed into a sum of sine and cosine terms
]
== Fourier Series Complex Notation
#rect()[
  #text(fill: gray, size: 0.75em)[#align(right)[Euler: $e^(j x) = cos(x) + j sin(x)$]]

  - Fourier series in sine-cosine form (with period $P$)

  $ f(x) = A_0 + sum_(n=1)^(infinity) A_n cos((2 pi n x) / P) + B_n sin((2 pi n x) / P) $

  #text(size: 0.75em)[#highlight[Phase information inside $A_0$ and $B_0$]]

  - Complex (exponential) form

  $ f(x) = sum_(n=-infinity)^(infinity) c_n e^(j (2 pi n) / P x) $

  - Coefficient

  $ c_n = 1 / P integral_(-P\/2)^(P\/2) f(x) e^(-j (2 pi n) / P x) d x $
]
// #rect()[
//   TODO:
//   + reading sinus arguments like 2pi & freq
//   + what it means to have harmonic functions in two dimensions
//   + What are Harmonics
//   + 2d Fourier Transform
// ]
// #rect()[
//   TODO:
//   + 2d DFT - #highlight[Convolution Theorem  - important]
//   + spacial domain - frequency domain -> convolution theorem
//   + DC part/Value from DFT
//   + How to read 2d DFT display
// ]
#rect(inset: 1pt)[
  #align(center, image(width: 25em, "/assets/image-2.png"))
  #align(center, image(width: 25em, "/assets/image-3.png"))
]
== Filtering in Frequency Domain
#rect(inset: 1pt)[
  #image("/assets/image-5.png")
  #box(inset: 2pt)[
    + Determine padding parameters $P$ and $Q$ _(see below)_
    + DFT: #h(1em) $F_("pad")(u, v) = "FFT"( f_p(x, y) )$
    + DFT: #h(1em) $H_p(u, v) = "FFT"( h_p(x, y) )$
    + Multiply (pointwise): $G_p(u, v) = F_p(u, v) · H_p(u, v)$
    + IDFT: #h(1em) $g_p(x, y) = "Real" ( "IFFT"( G_p(u, v) ) )$
    + Choose region: $g(x, y) = g_p(?, ?)$
  ]
]
#rect(inset: 1pt)[
  #image("/assets/image-28.png")
]
// #rect()[
//   TODO: relation of applying fft2 on image, then filter, then multiply
//   TODO: PSF - point spread functions
// ]
#rect()[
  $
    g[x, y] = text(#purple, C) + text(#blue, A) sin(2 pi text(#red, k_x/M) x text(#orange, +-) 2 pi text(#green, k_y/N) y)
  $
  - #text(blue)[*Blue Component*] ($A$ or $0.5$): Amplitude
    - *Image Effect*: Controls the contrast of the pattern (the difference between the brightest white and darkest black regions).
    - *Spectra Effect*: Determines the magnitude (height or brightness) of the Dirac delta impulses (the peaks/dots) in the frequency domain.

  - #text(red)[*Red Component*] ($k_x/M$ or $10/M$): Horizontal Spatial Frequency
    - *Image Effect*: Determines the horizontal spacing of the waves. A higher value creates denser vertical or diagonal stripes along the x-axis.
    - *Spectra Effect*: Dictates the horizontal position (x-coordinate offset from the center origin) of the impulse peaks in the Fourier plane.

  - #text(green)[*Green Component*] ($k_y/N$ e.g., $10/N, 5/N, 20/N$): Vertical Spatial Frequency
    - *Image Effect*: Determines the vertical spacing of the waves. A higher value (like the $20/N$ in $g_4$ compared to $5/N$ in $g_2$) creates denser horizontal or diagonal stripes along the y-axis.
    - *Spectra Effect*: Dictates the vertical position (y-coordinate offset from the center origin) of the impulse peaks in the Fourier plane.

  - #text(orange)[*Orange Component*] ($+/-$): Sign/Phase Combiner
    - *Image Effect*: Determines the rotation or tilt angle of the 2D grating. A positive sign (as in $g_3$) tilts the grating one way, while a negative sign (as in $g_4$) rotates it orthogonally. *(Note: If the function is a sum of two separate sines like $g_1$ and $g_2$ rather than a single combined sine, it produces a checkerboard/grid pattern instead of angled stripes).*
    - *Spectra Effect*: Dictates which quadrants the impulse peaks appear in. A positive combined sine places impulses in opposite diagonal quadrants (e.g., top-right and bottom-left), while a negative sign shifts them to the adjacent diagonal quadrants (e.g., top-left and bottom-right). Summed sines ($g_1, g_2$) place impulses directly on the horizontal and vertical axes.
  - #text(purple)[*Purple Component*] ($C$ or $0.5$): DC Offset
    - usually always 0.5 (normalized img from 0 to 1) so img has no negative vals
    - *Image Effect*: Shifts the entire image's brightness up or down. A higher value brightens the image, while a lower value darkens it.
    - *Spectra Effect*: Determines the height of the central DC impulse in the Fourier plane. A higher DC offset results in a taller central peak, while a lower offset reduces its height.

]
#rect(inset: 1pt)[
  #image("/assets/image-4.png")
]
#rect()[
  Notch filter only possible in frequency domain, not in spacial domain
]
== Deconvolution
#rect()[
  - *Undo* the effect of the unwanted *convolution* (for now: filter kernel $h$ is known)
  - Let $hat(f)$ be the image that we want to recover (approximation of original image)

  $ hat(f)(x, y) * h(x, y) = g(x, y) $

  #h(8em)
  $ hat(F)(u, v) H(u, v) = G(u, v) $

  - *Inverse filtering*
  $ hat(F)(u, v) = G(u, v) / H(u, v) $

  - Finally, to recover $hat(f)$, we need to apply the inverse Fourier transform to $hat(F)$.
]
== Wiener Filter
#rect()[
  Assume *noise* $N(u, v) = sigma^2$ has a constant power spectrum. Where $H(u, v)$ close to zero $hat(F)(u, v)$ takes on huge values!

  $
    hat(F)(u, v) = frac(G(u, v), H(u, v)) = frac(F(u, v) dot H(u, v) + sigma^2, H(u, v))
  $

  How can this noise amplification be reduced? #text(fill: rgb("#2196F3"))[Wiener filter!]

  $
    hat(F)(u, v) = frac(G(u, v), H(u, v)) lr([frac(1, 1 + frac("NSR"(u, v), |H(u, v)|^2))]) = frac(H^*(u, v) G(u, v), |H(u, v)|^2 + "NSR"(u, v))
  $

  With noise-to-signal ratio (NSR)

  $
    "NSR"(u, v) = frac(|N(u, v)|^2, |F(u, v)|^2) = frac("Power of noise at" (u, v), "Power of signal (original image) at" (u, v))
  $


  Wienter filter approximation since N or F are most often not precisely known!:
  $ frac(H^*(u, v) G(u, v), |H(u, v)|^2 + K) $

]
