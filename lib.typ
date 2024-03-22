// Workaround for the lack of an `std` scope.
#let std-smallcaps = smallcaps
#let std-upper = upper

// Overwrite the default `smallcaps` and `upper` functions with increased spacing between characters.
// Default tracking is 0pt.
#let smallcaps(body) = std-smallcaps(text(tracking: 0.6pt, body))
#let upper(body) = std-upper(text(tracking: 0.6pt, body))

#let template(
  first-name: str,
  last-name: str,
  address: str,
  phone: str,
  email: str,
  paper-size: "a4",
  body,
) = {
  // Set document metadata.
  let name = first-name + " " + last-name
  set document(title: name + " CV", author: name)

  // Configure text properties.
  set text(font: "Cantarell", size: 9pt, hyphenate: false)

  // Set page properties.
  set page(
    paper: paper-size,
    margin: (x: 3cm, y: 4cm),
    numbering: "1 / 1",
    footer: context {
      set align(center)
      let c-p = counter(page).at(here()).first()
      let t-p = counter(page).final().first()
      text(tracking: 1.25pt, std-upper[
        #last-name Résumé -- Page #c-p of #t-p
      ])
    }
  )

  // Display title.
  align(center)[
    #text(weight: "semibold", size: 2em)[
      #std-upper(text(tracking: 3pt, name))
    ]
    #v(-1em)
    #std-upper(text(tracking: 1pt, address))

    #std-upper(text(tracking: 1pt, phone)) #h(1em) #std-upper(text(tracking: 1pt, email))
  ]

  // Configure heading properties.
  show heading: it => {
    set text(weight: "extrabold", size: 0.7em)
    line(length: 100%, stroke: 0.5pt)
    pad(
      top: -0.7em,
      left: 0.25em,
      bottom: 0.8em,
    )[#upper(it)]
  }

  // Configure paragraph properties.
  show par: set text(font: "Linux Libertine")
  set par(justify: true, linebreaks: "optimized")

  body
}

#let experience(
  body,
  place: none,
  title: none,
  location: none,
  time: none,
) = {
  set list(body-indent: 0.65em)

  let gr = grid.with(
    columns: (auto, 1fr),
    row-gutter: 0.75em,
    align: (left, right),
  )

  block(width: 100%, pad(left: 0.25em)[
    #gr(
      text(size: 1.2em, place), text(size: 1.2em, time),
      emph(title), text(location)
    )
    #body
  ])
}
