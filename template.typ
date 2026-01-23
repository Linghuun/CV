#import "@preview/fontawesome:0.6.0"

#let inner_margin = 1cm

#let title_box(
  title: "Title",
  subtitle: none,
  main_color,
  title_bg_color,
  title_color,
  outset,
  border
) = {
  [
    #context {
      let title = text(size: 14pt, smallcaps(title), fill: title_color)
      let title_size = measure(title)
      let poly = polygon(
        fill: title_bg_color,
        stroke: main_color + border,
        (0pt - outset.left, 0pt - outset.top),
        (title_size.width + title_size.height + outset.right, 0pt - outset.top),
        (title_size.width + outset.right, title_size.height + outset.bottom),
        (0pt - outset.left, title_size.height + outset.bottom),
      )
        block(
          outset: outset,
          width: 100%,
        )[
          #place(
            top+left,
            poly
          )
        #title
        #h(13pt)
        #subtitle
        ]
    }
  ]
}

#let entry(
  breakable: false,
  title: "",
  subtitle: "",
  main_color: rgb("#AEC6CF").darken(30%),
  title_bg_color: rgb("#AEC6CF"),
  title_color: black,
  bg_color: rgb("#AEC6CF"),
  border: 1.5pt,
  inset: (left : 5pt, right: 5pt, top: 5pt, bottom:5pt),
  body: none,
) = {
  [
    #context (
      block(
        breakable: breakable,
        fill: bg_color,
        stroke: main_color + border,
        inset : inset,
        [
          #title_box(title: title, subtitle: subtitle, main_color, title_bg_color, title_color, (left : 5pt, right: 5pt, top: 5pt, bottom:5pt), border)
          #body
        ]
      )
    )
  ]
}


#let contact_entries(entries) = {
  let res = ()
  for entry in entries.keys() {
    let key = entry
    if entry.starts-with("fa-") {
      entry = eval(entry + "()", scope: dictionary(fontawesome))
    }
    res.push(align(center)[#entry])
    res.push({
      set align(horizon)
      entries.at(key)})
  }
  grid(
    columns: (auto, auto),
    column-gutter: 0.5em,
    row-gutter: 0.7em,
    ..res
  )
}

#let education_entries(entries) = {
  grid(
    columns: (auto, auto),
    gutter: 1em,
    align: horizon,
    ..for entry in entries {
      let school = entry.at("school", default: "")
      let city = entry.at("city", default: "")
      let has_details = school != "" or city != ""

      (
        // First row
        align(center)[#text(size: 11pt, weight: "bold", entry.date)],
        align(left + horizon)[#text(size: 13pt, weight: "bold", entry.formation)],

        // Second row (optional)
        ..(if has_details {
          (
            [], // Empty cell for the first column
            box(inset: (top: -3pt, rest: 0pt))[
              #text(size: 12pt, school + " - " + emph(city))
            ]
          )
        }),

        // Third row
        [],
        box(inset: (top: -3pt, bottom: -4pt, rest: 0pt), entry.body),

        // Fourth "row" (to separate 2 entries)
        [],
        []
      )

    }
  )
}


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
        inset: (right: inner_margin/2, left :inner_margin/2, rest: inner_margin),
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