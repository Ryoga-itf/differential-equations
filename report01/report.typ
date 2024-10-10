#import "../template.typ": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/physica:0.9.2": *

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第1回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 10 月 3 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

== 問題 1

=== (1)

与えられた解について両辺を微分すると、

$
x &= g/2 t^2 + v_0 t + x_0 \
therefore dv(x, t) &= g t + v_0 \
therefore dv(x, t, 2) &= g
$

=== (2)

与えられた解について両辺を微分すると、

$
x &= X sin(omega t + theta) \
therefore dv(x, t) &= X omega cos (omega t + theta) \
therefore dv(x, t, 2) &= - X omega^2 sin(omega x + theta) = - omega^2 x
$

=== (3)

与えられた解について両辺を微分すると、

$
x &= A e^(mu t) + B e^(-mu t) \
therefore dv(x, t) &= A e^(mu t) mu - B e^(-mu t) mu \
therefore dv(x, t, 2) &= A e^(mu t) mu^2 + B e^(-mu t) mu^2 = mu^2 (A e^(mu t) + B e^(-mu t)) = mu^2x
$

=== (4)

与えられた解について両辺を微分すると、

$
x &= A e^(lambda t) + B e^(-lambda t) + X sin(lambda t + theta) \
therefore dv(x, t) &= A e^(lambda t) lambda - B e^(-lambda t) lambda + X cos(lambda t + theta) lambda \
therefore  dv(x, t, 2) &= A e^(lambda t) lambda^2 + B e^(-lambda t) lambda^2 - X sin(lambda t + theta) lambda^2 \
therefore  dv(x, t, 3) &= A e^(lambda t) lambda^3 - B e^(-lambda t) lambda^3 - X cos(lambda t + theta) lambda^3 \
therefore  dv(x, t, 4) &= A e^(lambda t) lambda^4 + B e^(-lambda t) lambda^4 + X sin(lambda t + theta) lambda^4 = lambda^4 (A e^(lambda t) + B e^(-lambda t) + X sin(lambda t + theta)) = lambda^4 x \
$

=== (5)

解 $y &= C x - C^2$ について両辺を微分すると、

$
y &= C x - C^2 \
therefore y' &= C \
$

よって、$y'^2 = C^2, x y' = C x$ であるから、

$
y'^2 - x y' + y = C^2 - C x + y = y - y = 0
$

また、解 $y &= x^2/4$ について両辺を微分すると、


$
y &= x^2/4 \
therefore y' &= x/8 \
$

よって、$y'^2 = x^2/16, x y' = x^2/8$ であるから、

$
y'^2 - x y' + y = x^2 / 16 - x^2/8 + x^2/4 = y - y = 0
$

== 問題 2

全問より与えられた微分方程式の解は以下のように表される

$
x = X sin(omega t + theta) space space space ("ここで" X, theta "は定数")
$

また、

$
x' = X omega cos(omega t + theta)
$

初期条件を代入すると

$
x = X sin theta = 3, x' = X omega cos theta = 0
$

特に $omega != 0$ であるから、$X cos theta = 0$

ここで $X = 0$ は不適であるから $cos theta = 0$
よって、

$
theta = pi / 2 + 2n pi, space 3 / 2 pi + 2n pi
$

だだし、$n$ は整数である。

また、$theta = pi / 2 + 2n pi$ のとき $X = 3$ が、$theta = 3 / 2 pi + 2n pi$ のとき $X = -3$ が得られる。

よって、求める解は

$
x = 3sin(omega t + pi / 2), space -3sin(omega t + 3 / 2 pi)
$

すなわち、

$
x = 3cos omega t
$
