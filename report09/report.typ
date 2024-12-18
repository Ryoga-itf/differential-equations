#import "../template.typ": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/physica:0.9.2": *

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第9回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 12 月 18 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

#set math.mat(gap: 0.5em)

== 問題1

=== (1)

与えられた条件より、

$
u'_1 = u_2 \
u''_2 + u_1 = 0 \
$

よって、

$
dv(, x) bold(U)
= mat(
  0, 1;
  -1, 0;
)
mat(
  u_1;
  u_2;
)
$

以上より、求める行列 $A$ は

$
A = mat(
  0, 1;
  -1, 0;
)
$

=== (2)

与えられた条件より、

$
y' = u_1 - y \
y' = u_2 + y \
$

よって、

$
dv(, x) bold(V)
= mat(
  u'_1;
  u'_2;
)
= mat(
  y'' + y';
  y'' - y';
)
= mat(
  y'' + u_2 + y;
  y'' - u_1 + y;
)
= mat(
  u_2;
  -u_1;
)
= mat(
  0, 1;
  -1, 0;
)
mat(
  u_1;
  u_2;
)
$

以上より、求める行列 $A$ は

$
A = mat(
  0, 1;
  -1, 0;
)
$

== 問題2

#let bY = $bold(Y)$
#let bF = $bold(F)$
#let Fm = $mat(F_1;F_2;)$

#let intro(a1, a2, a3, a4) = [
  指数関数解を仮定して、

  $
  bY
  = bF e^(k x)
  = Fm e^(k x)
  $

  とおくと、

  $
  mat(
    #a1, #a2 ;
    #a3, #a4 ;
  )
  Fm
  = k Fm
  $
]

=== (1)

#intro(-1, 1, 2, 0)

固有方程式を解くと、$k = 1, -2$

$k = 1, -2$ に対応する固有ベクトルは、それぞれ、 $mat(1;2;), mat(1;-1;)$

よって、一般解は

$
bY = c mat(1;2;) e^(x) + d mat(1;-1;) e^(-2x)
$

=== (2)

#intro(1, 1, 2, 1)

固有方程式を解くと、$k = 1 + sqrt(2), 1 - sqrt(2)$

$k = 1 + sqrt(2), 1 - sqrt(2)$ に対応する固有ベクトルは、それぞれ、 $mat(1;sqrt(2);), mat(1;-sqrt(2);)$

よって、一般解は

$
bY = c mat(1;sqrt(2);) e^((1 + sqrt(2))x) + d mat(1;-sqrt(2);) e^((1 - sqrt(2))x)
$

=== (3)

#intro(0, 1, 1, 0)

固有方程式を解くと、$k = 1, -1$

$k = 1, -1$ に対応する固有ベクトルは、それぞれ、 $mat(1;1;), mat(1;-1;)$

よって、一般解は

$
bY = c mat(1;1;) e^(x) + d mat(1;-1;) e^(-x)
$

=== (4)

#intro(0, 1, -1, 0)

固有方程式を解くと、$k = i, -i$

$k = i, -i$ に対応する固有ベクトルは、それぞれ、 $mat(1;i;), mat(1;-i;)$

よって、一般解は

$
bY = c mat(1;i;) e^(i x) + d mat(1;-i;) e^(-i x)
$

== 問題3

#let intro(a1, a2, a3, a4) = [
  代数関数解を仮定して、

  $
  bY
  = bF x^(k)
  = Fm x^(k)
  $

  とおくと、

  $
  mat(
    #a1, #a2 ;
    #a3, #a4 ;
  )
  Fm
  = k Fm
  $
]

=== (1)

#intro(0, 2, 2, 3)

固有方程式を解くと、$k = 4, -1$

$k = 4, -1$ に対応する固有ベクトルは、それぞれ、$mat(1;2;), mat(-2;1;)$

よって一般解は、

$
bY = c mat(1;2;) x^(4) + d mat(-2;1;) x^(-1)
$

=== (2)

#intro(6, 3, 2, 5)

固有方程式を解くと、$k = 4, -1$

$k = 3, 8$ に対応する固有ベクトルは、それぞれ、$mat(1;-1;), mat(3;2;)$

よって一般解は、

$
bY = c mat(1;-1;) x^(3) + d mat(3;2;) x^(8)
$
