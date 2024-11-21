#import "../template.typ": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/physica:0.9.2": *

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第7回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 11 月 21 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

== 問題1

=== (1)

特性方程式は $k^2 - 5 k + 6 = 0$ であり、
この解は $k = 2, 3$

よって、$c_1, c_2$ を任意の定数すると一般解は、

$
y = c_1 x^2 + c_2 x^3
$

=== (2)

特性方程式は $k^2 - 2 m k + m^2 = 0$ すなわち $(k - m)^2 = 0$ であり、
この解は、$k = m$ （重解）

よって、$c_1, c_2$ を任意の定数すると一般解は、

$
y = (c_1 + c_2 log x) x^m
$

=== (3)

特性方程式は $k^2 - 2 k + 10 k = 0$ であり、
この解は $k = 1 plus.minus 3 i$

よって、$c_1, c_2$ を任意の定数すると一般解は、

$
y = x ( c_1 cos(3 log x) + c_2 sin(3 log x) )
$

== 問題2

=== (1)
=== (2)
=== (3)
=== (4)

== 問題3

=== (1)
=== (2)
=== (3)
