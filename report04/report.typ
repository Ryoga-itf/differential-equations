#import "../template.typ": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/physica:0.9.2": *
#import "../utils/fraction.typ": *

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第4回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 10 月 30 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

#let get_expo(f) = {
  let d = f.n / f.m
  if (d == 1) {
    $$
  } else if (d == -1) {
    $-$
  } else {
    display_frac(f)
  }
}

#let question1(p, q) = {
  let pdiv = div_frac(p, frac(2))
  let k = sub_frac(q, div_frac(mul_frac(p, p), frac(4)))
  let l = sqrt_frac(abs_frac(k))

  let z_ans = if (k.n == 0) {
    $T O D O$
  } else {
    let disp_l = get_expo(l)
    if (k.n / k.m > 0) {
      $a sin #disp_l x + b cos #disp_l x$
    } else {
      $a e^(#get_expo(l) x) + b e^(#get_expo(mul_frac(frac(-1), l))x)$
    }
  }


  let y_ans = if (k.n == 0) {
    $T O D O$
  } else {
    if (k.n / k.m > 0) {
      let disp_l = display_frac(l)
      $(a sin #disp_l x + b cos #disp_l x) e^(#get_expo(mul_frac(pdiv, frac(-1)))x)$
    } else {
      let w = sub_frac(l, div_frac(p, frac(2)))
      let o = sub_frac(mul_frac(frac(-1), l), div_frac(p, frac(2)))
      $a e^(#get_expo(w) x) + b e^(#get_expo(o)x)$
    }
  }

  [
    $z(x) = e^(#get_expo(pdiv) x) y(x)$ とおくと、
    $
      dv(z, x, 2) #display_frac(k, display_sign: true) z = 0
    $
    となる。これは標準形。

    また、これは $lambda = plus.minus #display_frac(l) #(if l.n/l.m < 0 {$i$})$ のときに相当。
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

#question1(frac(-2), frac(5))

=== (2)

#question1(frac(4), frac(-5))

=== (3)

両辺を $2$ で割ると、

$
y'' - y' + 5/2 y = 0
$

#question1(frac(-1), frac(5, m: 2))

=== (4)

#question1(frac(3), frac(-4))

=== (5)

両辺を $2$ で割ると、

$
y'' + 3 y' + 5/2 y = 0
$

#question1(frac(3), frac(5, m: 2))


=== (6)

両辺を $3$ で割ると、

$
y'' - 1/3 y' - 2/3 y = 0
$

#question1(frac(-1, m: 3), frac(-2, m: 3))

== 問題 2
