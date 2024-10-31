#import "../template.typ": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/physica:0.9.2": *

#let env = parse_dotenv(read("./.env"))

#show: project.with(
  week: "第4回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 10 月 31 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

#let get_expo(p, q) = {
  if (calc.rem(p, q) != 0) {
    if (p / q < 0) {
      $- #calc.abs(p) / #calc.abs(q)$
    } else {
      $#calc.abs(p) / #calc.abs(q)$
    }
  } else { 
    if (p / q == 1) {
      $$
    } else if (p / q == -1) {
      $-$
    } else {
      $#{p / q}$
    }
  }
}

#let question1(p, q) = {
  let pdiv = get_expo(p, 2)
  let t = 4 * q - p * p
  let g = calc.gcd(t, 4)
  let k = if (g == 4) {
    if (t / 4 < 0) { $#{t / 4}$ } else { $+ #{t / 4}$ }
  } else {
    if (t / 4 < 0) { $- #calc.abs(t / g) / #{4 / g}$ } else { $+ #{t / g} / #{4 / g}$ }
  }

  let l = int(calc.sqrt(calc.abs(t / 4)))

  let z_ans = if (t / 4 == 0) {
    $T O D O$
  } else {
    if (t / 4 > 0) {
      $a sin #l x + b cos #l x$
    } else {
      $a e^(#l x) + b e^(#l x)$
    }
  }


  let y_ans = if (t / 4 == 0) {
    $T O D O$
  } else {
    if (t / 4 > 0) {
      $(a sin #l x + b cos #l x) e^(#get_expo(-p, 2) x)$
    } else {
      $a e^(#get_expo(2 * l - p, 2) x) + b e^(#get_expo(2 * l - p, 2) x)$
    }
  }

  [
    $z(x) = e^(#{pdiv} x) y(x)$ とおくと、
    $
      dv(z, x, 2) #{k}z = 0 \
    $
    となる。これは標準形。

    また、これは $lambda = plus.minus #l$ のときに相当。
    これの一般解は、
    $
      z(x) = #z_ans
    $
    よって、最終的に、
    $
      y(x) = #y_ans
    $
    となる。
  ]
}

== 問題 1

=== (1)

#question1(-2, 5)

=== (2)

#question1(4, -5)
