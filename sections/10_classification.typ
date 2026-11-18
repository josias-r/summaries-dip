= Classification
#rect()[
  - *pattern vector*: vector of descriptors
    - $underline(x)^T = (x_1, x_2, x_3, ..., x_n) quad (underline(x) "column vector")$
  - *pattern space*: each descriptor is a dimension in the pattern space
]
== Minimum Distance Classifier
#rect()[
  *Classes mean*

  - $W$ number of classes
  - $N_j$ number of feature vectors per class

  $ ("class means") quad underline(m)_j = frac(1, N_j) sum_(x in K_j) underline(x) quad j = 1 .. W $

  - decision measure based on minimal Euclidean distance

  $ D_j (underline(x)) = norm(underline(x) - underline(m)_j) quad j = 1 .. W $

  - decision function (for proof see Gonzalez)

  $
    d_j (underline(x)) = underline(x)^T dot underline(m)_j - frac(1, 2) underline(m)_j^T dot underline(m)_j quad j = 1 .. W
  $

  - decision plane

  $
    d_i (underline(x)) - d_j (underline(x)) = underline(x)^T (underline(m)_i - underline(m)_j) - frac(1, 2) (underline(m)_i - underline(m)_j)^T dot (underline(m)_i + underline(m)_j) = 0
  $

  *A more appropriate measure of distance is the Mahalanobis distance*
  $
    D_j (underline(x)) = sqrt((underline(x) - underline(m)_j)^T dot C_j^(-1) dot (underline(x) - underline(m)_j)) quad j = 1 .. W
  $
  With $C_j$ being the covariance matrix for class $j$:
  $
    C_j = frac(1, N_j) sum_(x in K_j) (underline(x) - underline(m)_j) dot (underline(x) - underline(m)_j)^T
  $

  *Problems:* Does _not_ consider...
  - ... class probability
  - ... variance of class (with Euclidean distance)
  - ... cost of misclassification
]
== Bayes Classifier
#rect()[
  - optimal statistical classifier

  *Bayes' theorem:*
  $ P(A | B) = frac(P(A) dot P(B | A), P(B)) = frac(P( A inter B), P(B)) $
  $ p(K_i | x_(1,...), x_n) = frac(p(K_i) p(x_(1,...), x_n | K_i), p(x_(1,...), x_n)) $

  *Decision function:*
  $
    d_j (underline(x)) = frac(1, (2pi)^(n\/2) |C_j|^(1\/2)) e^(- 1/2 (underline(x) - underline(m)_j)^T C_j^(-1) (underline(x) - underline(m)_j)) dot p(K_j)
  $

  + TODO: simplification log and sumplification equal priors
  + TODO: MAP (Maximum a posteriori) and ML (Maximum likelihood)

]
