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

#let question2(p, q) = {
  let Df = sub_frac(mul_frac(p, p), mul_frac(frac(4), q))
  let D = Df.n / Df.m
  [
    特性方程式は、
    $lambda^2 #display_frac(p, display_sign: true) lambda #display_frac(q, display_sign: true) = 0$
    である。

    #(if (D > 0) {
      []
    } else if (D == 0) {
      let ans = div_frac(p, frac(-2))
      [
        この解は、重解で $lambda = #display_frac(ans)$ である。

        これより、一般解は、
        $
          y(x) = (a x + b) e^(#get_expo(ans)x)
        $
      ]
    } else {
      []
    })
  ]
}

=== (1)

#question2(frac(-8), frac(15))

この解は、実数解2つ $lambda = 3, 5$ である。

これにより、一般解は、
$
  y(x) = a e^(3 x) + b e^(5 x)
$

=== (2)

#question2(frac(8), frac(16))

=== (3)

#question2(frac(-8), frac(32))

この解は、複素数解 2 つ $lambda = 4 plus.minus 4 i$ である。

これにより、一般解は、
$
  y(x) &= e^(4 x) (a cos 4 x + b sin 4 x)
$

=== (4)

与えられた方程式の両辺を $2$ で割ると、
$
  y'' - 5/2 y' + 3/2 y = 0
$

#question2(frac(-5, m: 2), frac(3, m: 2))

この解は、実数解2つ $lambda = 1, 3/2$ である。

これにより、一般解は、
$
  y(x) = a e^(x) + b e^(3/2 x)
$

=== (5)

与えられた方程式の両辺を $2$ で割ると、
$
  y'' - 5/2 y' + 2 y = 0
$

#question2(frac(-5, m: 2), frac(2))

この解は、複素数解 2 つ $lambda = (5 plus.minus sqrt(7) i) / 4$ である。

これにより、一般解は、
$
  y(x) &= e^(5/4 x) (a cos sqrt(7)/4 x + b sin sqrt(7)/4 x)
$

=== (6)

特性方程式は、$lambda^2 - (alpha + beta) lambda + alpha beta = 0$ である。

この解は、$lambda = alpha, beta$

$alpha, beta$ は実数であるから、この方程式は複素数解を持たない。

$alpha = beta$ のとき、一般解は、
$
  y(x) = (a x + b) e^(alpha x)
$

それ以外のとき、一般解は、
$
  y(x) = a e^(alpha x) + b e^(beta x)
$

== 問題 3

#set enum(numbering: "(i)")

+ $omega^2 > nu^2 \/ 4$ の場合
  $
    x(t)  &= e^(-nu t \/ 2) (a cos Omega t + b sin Omega t) \
    x'(t) &= - nu/2 e^(-nu t \/ 2) (a cos Omega t + b sin Omega t) + e^(-nu t \/ 2) Omega (-a sin Omega t + b cos Omega t) \
          &= e^(-nu t \/ 2) (-nu / 2 (a cos Omega t + b sin Omega t) + Omega (-a sin Omega t + b cos Omega t) ) \
          &= e^(-nu t \/ 2) ((b Omega - (a nu) / 2)cos Omega t + (-a Omega - (b nu) / 2) sin Omega t)  \
  $

  $x(0) = a = x_0, space x'(0) = b Omega - (a nu) / 2 = 0$ を満たすように $a, b$ を決めると、
  $
    a = x_0, space b = (nu x_0) / (2 Omega)
  $
  これを代入すると、

  $
    x(t) &= e^(-nu t \/ 2) (x_0 cos Omega t + (nu x_0) / (2 Omega) sin Omega t) \
         &= x_0 e^(-nu t \/ 2) (cos Omega t + nu / (2 Omega) sin Omega t)
  $

+ $omega^2 = nu^2 \/ 4$ の場合
  $
    x(t)  &= (a + b t) e^(-nu t \/ 2) \
    x'(t) &= - nu/2 e^(-nu t \/ 2) (a + b t) + e^(-nu t \/ 2) b
          &= e^(- nu t \/ 2) (-nu/2 (a + b t) + b)
  $

  $x(0) = a = x_0, space x'(0) = - nu/2 a + b = 0$ を満たすように、$a, b$ を決めると、
  $
    a = x_0, space b = (nu x_0) / 2
  $
  これを代入すると、

  $
    x(t) = x_0 (1 + (nu t) / 2) e^(-nu t \/ 2)
  $

+ $omega^2 < nu^2 \/ 4$ の場合
  $
    x(t)  &= (a e^(gamma t) + b e^(- gamma t)) e^(- nu t \/ 2) \
    x'(t) &= - nu / 2 (a e^(gamma t) + b e^(- gamma t)) e^(- nu t \/ 2) + gamma (a e^(gamma t) - b e^(- gamma t)) e^(- nu t \/ 2) \
  $

  $x(0) = a + b = x_0, space x'(0) = - nu/2 (a + b) + gamma (a - b) = 0$ を満たすように $a, b$ を決めると、
  $
    a = x_0 / 2 (1 + nu / (2 gamma)), space b = x_0 / 2 (1 - nu / (2 gamma))
  $
  これを代入すると、

  $
    x(t) &= (x_0 / 2 (1 + nu / (2 gamma)) e^(gamma t) + x_0 / 2 (1 - nu / (2 gamma)) e^(- gamma t) ) e^(-nu t \/ 2) \
         &= x_0 e^(-nu t \/ 2) (cosh gamma t + nu / (2 gamma) sinh gamma t)
  $
