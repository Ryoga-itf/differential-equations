#let textL = 1.8em
#let textM = 1.6em
#let fontSerif = ("Noto Serif", "Noto Serif CJK JP")
#let fontSan = ("Noto Sans", "Noto Sans CJK JP")

#let project(week: -1, authors: (), date: none, body) = {
  let title = "微分方程式 " + str(week) + "レポート"
  set document(author: authors.map(a => a.name), title: title)
  set page(numbering: "1", number-align: center)
  set text(font: fontSerif, lang: "ja")

  show heading: set text(font: fontSan, weight: "medium", lang: "ja")
  
  show heading.where(level: 2): it => pad(top: 1em, bottom: 0.4em, it)
  show heading.where(level: 3): it => pad(top: 1em, bottom: 0.4em, it)

  // Figure
  show figure: it => pad(y: 1em, it)
  show figure.caption: it => pad(top: 0.6em, it)
  show figure.caption: it => text(size: 0.8em, it)

  // Title row.
  align(center)[
    #block(text(textL, weight: 700, title))
    #v(1em, weak: true)
    #date
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        *#author.name* \
        #author.email \
        #author.affiliation
      ]),
    ),
  )

  // Main body.
  set par(justify: true)

  body
}
