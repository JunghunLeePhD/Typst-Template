#import "macros.typ": *

#set document(
  title: "My Typst Project",
  author: "Your Name",
)
#set page(
  paper: "a4",
  margin: 2.5cm,
  numbering: "1",
)
#set text(
  font: "Linux Libertine",
  lang: "en",
)
#set heading(
  numbering: "1.1",
)

#align(center)[
  #text(
    size: 24pt,
    weight: "bold",
  )[Project Title] \
  #v(1em)
  Your Name \
  #datetime.today().display()
]

#outline(indent: auto)
#pagebreak()

#include "sections/introduction.typ"

#bibliography("references.bib")
