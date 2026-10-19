= Intensity Transformations
#rect(inset: 1pt)[
  #align(center, image(width: 25em, "/assets/image.png"))
]
== Log Transformations
#rect()[
  $ s = underbrace(c, "usually  = 1") * log(1 + r) $
  #align(center, image(width: 10em, "/assets/image-16.png"))
]
== Gamma Correction
#rect()[
  $ s = underbrace(c, "usually  = 1") * r^gamma $
  #align(center, image(width: 10em, "/assets/image-15.png"))
]
= Contrast
== Linear Contrast Stretching
#rect()[
  $
    s = s_min + (r - r_min) * (s_max - s_min) / (r_max - r_min) quad quad s_min "to" s_max "usually full bit range (0 to 255)"
  $
  #align(center, image(width: 11em, "/assets/image-17.png"))
]
== Histogram Equalization
#rect()[
  #image("/assets/image-18.png")
  $
    s_k = T(r_k) = (L - 1) "CDF"(r_k) =\
    = (L - 1) sum_(i=0)^(k) p_r (r_i) = bold((L - 1) sum_(i=0)^(k) frac(n_i, M · N))
  $
]
== Histogram Matching
#rect()[
  + Equalization of input image to get $s_k = T(r_k) = (L - 1) "CDF"(r_k)$
  + Derive/calc $G(z)$: The CDF of the desired final histogram
  + Find $z_q = G^(-1)(s_k)$ to get the final output
  + Inverting $G(z)$ to get $G^(-1)(s)$ is not trivial, so we use a lookup table:
  ```python
  for src_pixel_value in range(256):
    # find the closest pixel value in the target cdf to the source cdf value
    differences = np.abs(target_cdf - src_cdf[src_pixel_value])
    closest_target_pixel = np.argmin(differences) # the idx = the pixel value in the target cdf

    lookup_table[src_pixel_value] = closest_target_pixel
  # map using the lookup table
  matched_img = lookup_table[source_img]
  ```
  // TODO: understand lookup table better
]
== Local Histogram Equalization
#rect()[
  - Define a _neighborhood_ and move center from pixel to pixel (horizontal and vertical)
  - At each location, the histogram of the pixels in the neighborhood is computed and histogram equalization or matching is performed.
  - Repeat for all pixels

  #image("/assets/image-19.png")
]
== Local Enhancement Using Histogram Statistics
#rect()[
  With computed mean and standard deviation for global picture and again for local area, we can target enhacements locally.
]
