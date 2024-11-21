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

与えられた微分方程式を変形すると、

$
y'' + 2/x y' + y = 0
$

ここで、

$
y(x) 
&= u(x) exp(-1/2 integral^x 2 / x' dd(x')) \
&= u(x) exp(-log x) \
&= u(x)/x
$

とすると、

$
y'  &= (u' x - u) / x^2 \
y'' &= ((u'' x + u' - u') x^2 - (u' x - u) 2 x) / x^4 = (u'' x^2 - 2u' x +2u) / x^3
$

であるから、

$
&   (u'' x^2 - 2u' x +2u) / x^3 + 2/x (u' x - u) / x^2 + u/x = 0 \
&=> (u'' x^2) / x^3 + u/x = 0 \
&=> u'' / x + u/x = 0 \
&=> u'' + u = 0 \
$

これは標準形。
これを解くと、一般解 $u(x) = c_1 cos x + c_2 sin x$ を得る。

これより、

$
y(x) = (c_1 cos x + c_2 sin x) / x
$

=== (2)

#let ex2 = $exp(x^2 / 2)$

$
y(x)
&= u(x) exp(-1/2 integral^x -2x' dd(x')) \
&= u(x) exp(integral^x x' dd(x')) \
&= u(x) ex2
$


とすると、

$
y'  &= u' ex2 + u x ex2 \
    &= (u' + u x) ex2 \
y'' &= (u'' + u'x + u) ex2 + (u' + u x ) x ex2 \
    &= ( u'' + u' x + u + u' x + u x^2) ex2 \
    &= ( u'' + 2 u' x + u + u x^2) ex2 
$

であるから、

$
&   ( u'' + 2 u' x + u + u x^2) ex2 - 2 x (u' + u x) ex2 + (x^2 - 2) u ex2 = 0 \
&=> ex2 (u'' + 2u' x + u + u x^2 - 2 u' x - 2 u x^2 + u x^2 - 2 u) = 0 \
&=> ex2 (u'' - u) = 0 \
&=> u'' - u = 0
$

これは標準形。
これを解くと、一般解 $u(x) = c_1 exp(x) + c_2 exp(-x)$ を得る。

これより、

$
y(x) &= (c_1 exp(x) + c_2 exp(-x)) ex2 \
     &= c_1 exp(x^2 / 2 + x) + c_2 exp(x^2 / 2 - x)
$

=== (3)

与えられた微分方程式を変形すると

$
y'' + 3/x y' + 4/x^6 y = 0
$

ここで、

$
t'
&= exp(-integral^x 3/x' dd(x')) \
&= exp(-3 log x) \
&= x^(-3)
$

とすると、

$
t = integral x^(-3) dd(x) = -2 x^(-2)
$

である。

これより、

$
&   dv(y, t, 2) + 4/x^6 exp( 2 integral^x 3/x' dd(x') ) y = 0 \
&=> dv(y, t, 2) + 4/x^6 exp(6 log x) y = 0 \
&=> dv(y, t, 2) + 4/x^6 x^6 y = 0 \
&=> dv(y, t, 2) + 4 y = 0 \
$

これは標準形。
よって、

$
y(x) &= C_1 cos 2t + C_2 sin 2t \
     &= C_1 cos(-1/x^2) + C_2 sin(-1/x^2) \
     &= c_1 cos 1/x^2 + c_2 sin 1/x^2
$

ただし、$c_1 = C_1, c_2 = -C_2$ とおきなおした。

=== (4)


与えられた微分方程式を変形すると

$
y'' + x/(x^2 - 1) y' + 1/(x^2 - 1) y = 0
$

ここで、

$
t'
&= exp(-integral^x x'/(x'^2 - 1) dd(x') ) \
&= exp(-1/2 integral^x (x'^2 - 1)' / (x'^2 - 1) dd(x') ) \
&= exp(-1/2 log(x^2 - 1)) \
&= (x^2 - 1)^(1/2)
$

とすると、

$
t = integral^x 1/sqrt(x'^2 - 1) dd(x') = log(x + sqrt(x^2 - 1))
$

である。

これより、

$
&   dv(y, t, 2) + 1/(x^2 - 1) exp(2 integral^x x'/(x'^2 - 1) dd(x')) y = 0 \
&=> dv(y, t, 2) + 1/(x^2 - 1) exp(integral^x (x'^2 - 1)'/(x'^2 - 1) dd(x')) y = 0 \
&=> dv(y, t, 2) + 1/(x^2 - 1) exp(log(x^2 - 1)) y = 0 \
&=> dv(y, t, 2) + y = 0
$

これは標準形。
よって、

$
y(x) &= c_1 cos t + c_2 sin t \
     &= c_1 cos (log(x + sqrt(x^2 - 1))) + c_2 sin (log(x + sqrt(x^2 - 1)))
$

== 問題3

=== (1)
=== (2)
=== (3)
