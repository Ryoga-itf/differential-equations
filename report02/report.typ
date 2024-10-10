#import "../template.typ": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/physica:0.9.2": *

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第2回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 10 月 10 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

== 問題 1

=== (1)

与えられた式の両辺を $y^2$ で割った上で $x$ で積分すると、

$
dv(y, x) = y^2 / x => 1 / y^2 dv(y, x) = 1/x => integral 1 / y^2 dif y = integral 1/x dif x + c
$

だたし、ここで $c$ は任意定数である。

よって、

$
- 1/y = log abs(x) + c \
therefore 1/y = -log abs(x) - c \
therefore y = 1 / (-log abs(x) - c)
therefore y = 1 / (C - log abs(x))
$

ここで、$C$ は $C = -c$ である定数

以上より、以下の解が得られる。

$
y = x / (C - log abs(x))
$

=== (2)

与えられた式の両辺を $y^2$ で割った上で $x$ で積分すると、

$
dv(y, x) = y^2 / x^2 => 1 / y^2 dv(y, x) = 1 / x^2 =>integral 1 / y^2 dif y = integral 1 / x^2 dif x + c
$

ただし、ここで $c$ は任意定数である。

よって、

$
- 1/y = - 1/x + c \
therefore 1/y = 1/x - c \
therefore y = 1 / (1/x - c) = x / (1 - c x) = x / (1 + C x) \
$

ここで、$C$ は $C = -c$ である定数

以上より、以下の解が得られる。

$
y = x / (1 + C x)
$

=== (3)

与えられた式の両辺を $y^2$ で割った上で $x$ で積分すると、

$
dv(y, x) = y^2 / x^n => y^2 dv(y, x) = 1 / x^n => integral y^2 dif y = integral 1 / x^n dif x + c
$

ただし、ここで $c$ は任意定数である。

$n != 1$ であるから、

$
- 1/y = 1 / (1 - n) x^(1 - n) + c \
therefore 1/y = - 1 / (1 - n) x^(1 - n) - c \
therefore 1/y = 1 / (n - 1) x^(1 - n) - c \
therefore y = 1 / (1 / (n - 1) x^(1 - n) - c) = (n - 1) / (x^(1 - n) - (n - 1) c)
$

よって、一般解は

$
y = (n - 1) / (x^(1 - n) - (n - 1) c)
$

また、$(x, y) = (1, -1)$ を満たす解は、

$
-1 = (n - 1) / (1 - (n - 1) c) \
<=> -1 + (n - 1)c = n - 1 \
<=> (n - 1)c = n \
therefore c = n / (n - 1)
$

より、

$
y = (n - 1) / (x^(1 - n) - n)
$

=== (4)

与えられた式を変形すると、

$
(x^2 - x y) dv(y, x) + y^2 = 0 <=> dv(y, x) = -y^2 / (x^2 - x y)
$

右辺の分子と分母を $x^2$ で割ると、

$
dv(y, x) = - (y\/x)^2 / (1 - y\/x)
$

$v = y\/x$ とおく。つまり、$y = x v$ とおくと、$dv(y, x) = v + x dv(v, x)$ であるから、

$
v + x dv(v, x) = -v^2 / (1 - v) => dv(v, x) = 1/x (-v^2 / (1 - v) - v) \
therefore dv(v, x) = -1/x v/(1 - v) \
therefore (1 - v) / v dv(v, x) = - 1/x
$

よって、両辺を $x$ で積分すると、

$
integral (1 - v) / v dif v = integral -1/x dif x
$

=== (5)
=== (6)
=== (7)
