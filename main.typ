#set page(margin: 3mm, flipped: true)
#set text(size: 5.5pt, font: "Arial")
#set rect(width: 100%)
#set par(leading: 0.25em, spacing: 0.275em)

#show rect: it => {
  block(it, below: 0em)
}

#set rect(stroke: 0.5pt)

#show heading.where(level: 1): it => {
  set text(fill: white, weight: "bold", size: 5pt)
  set align(center)
  set block(above: 0em, below: 0em)
  rect(
    fill: black,
    stroke: 0.5pt + black,
    width: 100%,
    it.body,
    inset: 0.3em,
  )
}

#show heading.where(level: 2): it => {
  set text(fill: black, weight: "bold", size: 5pt)
  set align(center)
  set block(above: 0em, below: 0em)
  rect(
    fill: silver,
    stroke: 0.5pt + black,
    width: 100%,
    it.body,
    inset: 0.3em,
  )
}

#columns(4, gutter: 0pt)[
  #stack(
    include "sections/00_py_cheatsheet.typ",
    include "sections/01_introduction.typ",
    include "sections/02_intensity.typ",
    include "sections/03_spacial_filtering.typ",
    include "sections/04_frequency_domain.typ",
  )
]
