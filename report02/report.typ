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
integral (1 - v) / v dif v = integral -1/x dif x \
=> log abs(v) - v = - log abs(x) + c \
=> v e^(-v) = A / x
$

ただし、$A$ は正の実数 $(because A = e^c > 0)$

=== (5)

与えられた式を変形すると、

$
x dv(y, x) - y = 2 x^2 + 3 => dv(y, x) - 1/x y - 2x - 3/x = 0
$

1 階線形微分方程式とみなして、$p(x) = -1/x, q(x) = -2x - 3/x$ とおく。

$
accent(z, macron)(x) &= integral p(x) dif x = -log abs(x) \
z(x) &= e^(-accent(z, macron)(x)) = e^(log abs(x)) = abs(x) \
s(x) &= integral q(x) / z(x) dif x = integral (2x^2 + 3) dif x = 2/3 x^3 + 3x
$

よって、一般解は

$
y = abs(x) ( -2/3 x^3 - 3x + c)
$

=== (6)

与えられた式を変形すると、

$
dv(y, x) - y tan x = cos x <=> dv(y, x) - y tan x - cos x = 0
$

1 階線形微分方程式とみなして、$p(x) = -tan x, q(x) = -cos x$ とおく。


$
accent(z, macron)(x) &= integral p(x) dif x = log abs(cos x) \
z(x) &= e^(-accent(z, macron)(x)) = e^(-log abs(cos x)) = -abs(cos x) \
s(x) &= integral q(x) / z(x) dif x = integral (cos x) / abs(cos x) dif x = x
$

よって、一般解は

$
y = -abs(cos x)( -x + c )
$

=== (7)

$p(x) = 1/x, q(x) = x^2$ とおく。

$z = y^(-2)$ とおき、これを微分すると、

$
z' = -2y^(-3)y' \
therefore y^3 z' = -2y' \
therefore y' = - y^3 / 2 z'
$

よって、

$
- y^3 / 2 z' + p(x) y = q(x) y^3 \
=> -z' / 2 + p(x) y^(-2) = q(x) \
therefore -z'/2 + p(x) z = q(x) \
therefore z' - 2p(x) z + 2 q(x) = 0
$

1 階線形微分方程式とみなして、これを解くと、

$
accent(z, macron)(x) &= integral -2p(x) dif x = -2 log abs(x) \
z(x) &= e^(-accent(z, macron)(x)) = e^(-2 log abs(x)) = 1 / x^2 \
s(x) &= integral q(x) / z(x) dif x = integral -2 x^4 dif x = -2 / 5 x^5
$

よって、

$
z = 1 / x^2 (2 / 5 x^5 + c) <=> y^(-2) = 1 / x^2 (2 / 5 x^5 + c) = 2 / 5 x^3 + c/x^2
$

であるから、一般解は

$
y = -1 / sqrt( 2/5 x^3 + c/x^2 )
$

$(x, y) = (-1, 1)$ を満たす解は、

$
y = -1 / sqrt( 2/5 x^3 + 3 / (5 x^2))
$

== 問題 2

$p(x) = x^2, q(x) = -(1 + 2x^3), r(x) = x^4 + x = 1$ とおく。

$y(x) = Y(x) + x$ とおくと、

$
Y' + (2x p(x) + q(x))Y + p(x) Y^2 = 0
$

よって、

$
dv(z, x) - (2x p(x) + q(x)) z - p(x) = 0
$

1 階線形微分方程式とみなして、これを解くと、

$
accent(z, macron)(x) &= integral -(2x p(x) + q(x)) dif x = x \
z(x) &= e^(-accent(z, macron)(x)) = e^x \
s(x) &= integral -p(x) / z(x) dif x = integral -x^2 / x dif x = -1/2 x^2
$

よって、

$
z &= e^x (1/2 x^2 + c) \
=> 1/Y &= e^x (1/2 x^2 + c) \
=> Y &= 1 / (e^2 (1/2 x^2 + c)) \
=> y - x &= 1 / (e^2 (1/2 x^2 + c)) \
=> y &= 1 / (e^2 (1/2 x^2 + c)) + x \
$

また、$(x, y) = (0, 1)$ を満たす解は、$c = 1$ であるから、

$
y = 1 / (e^2 (1/2 x^2 + 1)) + x
$
