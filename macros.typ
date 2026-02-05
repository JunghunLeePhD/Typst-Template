// Define a math shortcut (like \newcommand)
#let R = $RR$ // Real numbers set
#let norm(x) = $|| #x ||$

// Define a styled block (like \newtheorem)
#let definition(title, body) = {
  block(
    fill: luma(240),
    stroke: luma(200),
    inset: 10pt,
    radius: 4pt,
    width: 100%,
    [
      *Definition: #title* \
      #body
    ]
  )
}