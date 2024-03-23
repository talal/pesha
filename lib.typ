// Text settings used across the template.
#let head-text = text.with(font: "Cantarell", weight: "medium")

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
  set text(size: 10pt, hyphenate: false)

  // Set page properties.
  set page(
    paper: paper-size,
    margin: (x: 17%, top: 14%, bottom: 11%),
    // Display page number in footer only if there are more than a single page.
    footer: context {
      let total = counter(page).final().first()
      if total > 1 {
        set align(center)
        let i = counter(page).at(here()).first()
        upper(head-text(size: 0.85em, tracking: 1.2pt)[
          #last-name Résumé --- Page #i of #total
        ])
      }
    }
  )

  // Display title and contact info.
  align(center)[
    #show text: upper
    #head-text(size: 1.8em, tracking: 3.2pt, name)
    #v(1.4em, weak: true)
    #show text: it => { head-text(size: 0.86em, tracking: 1.4pt, it) }
    #address
    #v(1em, weak: true)
    #phone #h(1em) #email
    #v(2em, weak: true)
  ]

  // Configure heading properties.
  show heading: it => {
    line(length: 100%, stroke: 0.5pt)
    pad(
      top: -0.85em,
      left: 0.25em,
      bottom: 0.6em,
      upper(head-text(weight: "black", size: 0.7em, tracking: 0.6pt, it))
    )
  }

  // Configure paragraph properties.
  set par(leading: 0.7em, justify: true, linebreaks: "optimized")

  body
}

#let experience(
  body,
  place: none,
  title: none,
  location: none,
  time: none,
) = {
  set list(body-indent: 0.85em)

  block(width: 100%, pad(left: 0.25em)[
    #text(size: 1.4em, place) #h(1fr) #text(size: 1.4em, time)
    #v(1em, weak: true)
    #if title == none {  v(-1em) }
    #emph(title) #h(1fr) #text(size: 0.9em, location)
    #v(1em, weak: true)
    #body
  ])
}

// Workaround for the lack of an `std` scope.
#let std-smallcaps = smallcaps
#let std-upper = upper

// Overwrite the default `smallcaps` and `upper` functions with increased spacing between
// characters. We do this so that when someone uses these functions they will get spacing
// which fits in better with the rest of the template.
#let smallcaps(body) = std-smallcaps(text(tracking: 0.6pt, body))
#let upper(body) = std-upper(text(tracking: 0.6pt, body))
