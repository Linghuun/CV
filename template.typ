#import "@preview/fontawesome:0.6.0"



#let inner_margin = 1.2cm

#let resume(
  firstname: "",
  lastname: "",
  actual: "",
  picture: "",
  color: rgb("#AEC6CF"),
  side: [],
  body
) = {
  set page(margin: 0pt)
  set text(hyphenate: false)
  grid(
    columns: (1fr, 2fr),
    grid.cell(
      fill: color,
      block(
        height: 100%,
        inset: (right: inner_margin/2, rest: inner_margin),
        {
          image(picture, width: 100%)
          align(center)[#text(size: 20pt, firstname + " " + lastname)]
          align(center)[#text(size: 15pt, actual)]
          side
        }
        
      )
    ),
    grid.cell(
      fill: color.lighten(85%),
      block(
        height: 100%,
        inset: (left: inner_margin/2, rest: inner_margin),
        {
          body
        }
      )
    ),

  )
}