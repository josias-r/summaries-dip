= Introduction
== Pre-processing vs Processing digital images
#rect(inset: 0pt)[
  // table comparison - not as a picture, but as a table
  #table(
    columns: (auto, auto),
    table.header([Pre-Processing], [Processing]),
    [
      Manipulations to enhance image quality.
    ],
    [
      Operations on the processed image to analyze and extract information from it.
    ],

    [For Example: Noise removal, contrast enhancement, histogram equalization, blurr removal, sharpening, etc.],
    [For Example: Edge detection, segmentation, object recognition, etc.],
  )
]
== Histogram
#rect()[
  The histogram for images:
  Count per pixel value (i.e how many pixels have value 13) over full value range

  *Normalized histogram*:
  Divided by total number of pixels, so that the sum of all bins is 1.0 (= probability distribution of pixel values)
]
== Pixel Adjacency and Connectedness
#rect(inset: 1pt)[
  #image("/assets/image-14.png")
]
== Distances
#rect()[
  Given two points: $ (x_1, x_2) "and" (y_1, y_2) $

  *Euclidean distance*:
  $ d = sqrt((x_1 - y_1)^2 + (x_2 - y_2)^2) $
  *Manhattan distance*:
  $ d = |x_1 - y_1| + |x_2 - y_2| $
  *Chessboard distance*:
  $ d = max(|x_1 - y_1|, |x_2 - y_2|) $
]
== Visible Spectrum
#rect(inset: 1pt)[
  #image("/assets/image-13.png")
]
// == Quantization
// #rect()[
//   Images are quantized by sensors (like CMOS) and for digital storage (both spacially and each pixel value)

//   Due to quantization, some artifacts and limits are introduced in the image:
//   - Aliasing: When the image is sampled at a lower resolution than the original, leading to loss of detail and potential distortion.
//   - Quantization noise: The difference between the original continuous signal and the quantized digital representation
//   - Banding: Visible steps in color or intensity due to limited number of quantization levels
//   - Moire patterns: Interference patterns that can occur when two regular patterns overlap, often seen in digital images with fine textures.
// ]
// == CMOS vs CCD
// #rect()[
//   CMOS (Complementary Metal Oxide Semiconductor) and CCD (Charge Coupled Device) are two different types of image sensors used in digital cameras and imaging devices.

//   *CMOS*:
//   - Each pixel has its own amplifier and can be read independently.
//   - Lower power consumption.
//   - Faster readout speeds.
//   - More susceptible to noise.

//   *CCD*:
//   - Pixels are read out sequentially, transferring charge across the chip.
//   - Higher image quality with less noise.
//   - Slower readout speeds.
//   - Higher power consumption.

//   In summary, CMOS sensors are more common in consumer electronics due to their lower cost and power efficiency, while CCD sensors are often used in professional imaging applications where image quality is paramount.
// ]
== Mean and Standard Deviation
#rect()[
  $ mu_x = (sum x_i) / N $


  $ sigma_x = sqrt((sum (x_i - mu_x)^2) / N) $

  example: $ "img" = [[0,1], [2,3]] $
  $ mu_"img" = (0 + 1 + 2 + 3) / 4 = 1.5 $
  $ sigma_"img" = sqrt(((0 - 1.5)^2 + (1 - 1.5)^2 + (2 - 1.5)^2 + (3 - 1.5)^2) / 4) = sqrt(1.25) = 1.118 $
]
