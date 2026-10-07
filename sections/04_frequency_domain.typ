= Frequency Domain Image Processing
#rect()[
  TODO:
  + Undersstand "spacial frequency" more deeply
  + Furier Seris vs Furier Transform
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
#rect()[
  TODO:
  + reading sinus arguments like 2pi & freq
  + what it means to have harmonic functions in two dimensions
  + What are Harmonics
  + 2d Fourier Transform
]
#rect()[
  TPdp:
  + 2d DFT - #highlight[Convolution Theorem  - important]
  + spacial domain - frequency domain -> convolution theorem
  + DC part/Value from DFT
  + How to read 2d DFT display
]
#rect(inset: 1pt)[
  #image("/assets/image-2.png")
  #image("/assets/image-3.png")
]
== Filtering in Frequency Domain
#rect(inset: 1pt)[
  #image("/assets/image-5.png")
]
#rect()[
  TODO: relation of applying fft2 on image, then filter, then multiply
  TODO: PSF - point spread functions
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
