= Pixel Adjacency and Connectedness
#rect()[

  *Adjacency*
  - Two pixels $p$ and $q$ are adjacent if
    - They are neighbors ($p in N_4(q)$ or $p in N_8(q)$) AND
    - Some similarity criterion fulfilled (e.g., same or similar grayscale value)


  - Example:
  - Two pixels in a binary image are 4-adjacent if they are 4-neighbors and have both the same pixel value (0 or 1)


  *Connected Components*
  - Let S be a subset of the pixels
  - Two pixels are connected in S if there is a path between them that lies in S

]
