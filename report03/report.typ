#import "../template.typ": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/physica:0.9.2": *

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第3回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 10 月 23 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

== 問題 1

=== (1)

$
P(x, y) &= y^2 - y/x^2 \
Q(x, y) &= 1/x + 2x y
$

とおくと、

$
pdv(P, y) &= 2y - 1/x^2 \
pdv(Q, x) &= -1/x^2 + 2y
$

よって、$pdv(P, y) = pdv(Q, x)$ であるから、与えられた微分方程式は完全微分方程式である。

$a = 1, b = 0$ として公式を用いると、

$
& integral_1^x P(s, y) dd(x) + integral_0^y Q(1, t) dd(y) = C \
&=> integral_1^x ( y^2 - y / s^2 ) dd(x) + integral_0^y (1 + 2t) dd(t) = C \
&=> [ y^2 s + y/s ]_1^x + [ t + t^2 ]_0^y = C \
&=> x y ^ 2 + y/x - y^2 - y + y + y^2 = C \
&=> x y ^ 2 + y/x = C
$


以上より、一般解は $C$ を任意定数として

$
x y ^ 2 + y/x = C
$

=== (2)

$
P(x, y) &= y\
Q(x, y) &= y^2 tan y - x
$

とおくと、

$
pdv(, y) (mu P) = pdv(, x) (mu Q) = - 1/y^2
$

であるから、$mu$ は積分因子である。

よって、微分方程式 $(mu P) dd(x) + (mu Q) dd(y) = 0$ を考えると、これは完全微分方程式であるから、
$a = 0, b = 0$ として公式を用いると、

$
& integral_0^x 1 / y dd(s) + integral_0^y tan t dd(t) = C \
&=> [ s/y ]_0^x + [ -log abs(cos t) ]_0^y = C \
&=> x/y - log abs(cos y) + log abs(cos 0) = C \
&=> x/y - log abs(cos y) = C
$

以上より、一般解は $C$ を任意定数として

$
x/y - log abs(cos y) = C
$

=== (3)

$
P(x, y) &= 2y + 3y^2 \
Q(x, y) &= x + 3x y
$

とおくと、

$
P_y &= 2 + 6y \
Q_x &= 1 + 3y
$

$P_y != Q_x$ であるから与えられた微分方程式は完全微分方程式ではない。

$
(P_y - Q_x) / Q = (1 + 3y) / (x + 3x y) = 1/x
$

である。これは変数が $x$ のみの関数であるから、積分因子$mu$ は、

$
mu = e ^ (integral 1/x dd(x)) = e^(log x) = x
$

よって、微分方程式 $(mu P) dd(x) + (mu Q) dd(y) = 0$ を考えると、これは完全微分方程式であるから、
$a = 0, b = 0$ として公式を用いると、

$
& integral_0^x  (2y s + 3 y^2 s) dd(s) = C \
&=> [ y s^2 + 3/2 y^2 s^2 ]_0^x = C \
&=> x^2 y + 3/2 x^2 y^2 = C
$

以上より、一般解は $C$ を任意定数として

$
x^2 y + 3/2 x^2 y^2 = C
$

== 問題 2

=== (1)

両辺を $x$ で微分すると、

$
p = p + x p' - p' / p => p' (x - 1/p) = 0
$

$p' = 0$ のときは、$y = c x - log c$ これは一般解。

$x - 1/p = 0$ のとき、$y = x p - log p$ と連立し、$p$ を消去すると、

$
y = 1 - log 1/x = 1 - (log 1 - log x) = 1 + log x
$
となる。これは特異解。

=== (2)

両辺を $x$ で微分すると、

$
p = p + x p' + p' p / sqrt(1 + p^2) => p' (x + p / sqrt(1 + p^2)) = 0
$

$p' = 0$ のときは、$y = x c + sqrt(1 + c^2)$ これは一般解。

$x + p / sqrt(1 + p^2) = 0$ のとき、$y = x p + sqrt(1 + p ^ 2)$ と連立し、$p$ を消去すると、

$
y = (x - 1 / x) sqrt(x^2 / (1 - x^2))
$

となる。これは特異解。

=== (3)

両辺を $x$ で微分すると、

$
& p = 2p + 2p' x + 4 p' p \
& => -p = 2p' x + 4 p' p = 0 \
& => -p = (2x + 4p) p' \
& therefore -p dd(x) = (2x + 4p) dd(p) \
& => -p dd(x) - (2x + 4p) dd(p) = 0
$

以下、$P = -p, Q = -(2x + 4p)$ とおく。

$P, Q$ の偏微分を求めると $P_p = -1, Q_x = -2$ であるので、
この方程式は完全微分方程式ではない。

$
(P_p - Q_x) / P = -1/p
$

である。これは変数が $p$ のみの関数であるから、積分因子 $mu$ は、

$
mu = e^(-integral -1/p dd(p)) = e^(log p) = p
$

よって、微分方程式 $(mu P) dd(x) - (mu Q) dd(p) = 0$ を考えると、これは完全微分方程式であるから、
$a = 0, b = 0$ として公式を用いると、

$
& integral_0^x -p^2 dd(x) + integral_0^p -4t^2 dd(t) + c = 0 \
& => [-p^2 s]_0^x + [-4/3 t^3]_0^p + c = 0 \
& => -x p^2 - 4/3 p^3 + c = 0 \
& therefore x p^2 + 4/3 p^3 = C
$

よって、もとの式と連立することにより、

$
x = -4/3 p + C/p^2, space y = -2/3 p^2 + (2C) /p
$
