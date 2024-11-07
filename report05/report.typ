#import "../template.typ": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/physica:0.9.2": *

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第5回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 11 月 8 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

== 問題1

左辺は全ての問題で共通である。

よって、非斉次方程式の基本解は、

$
y_1 (x) = e^(2x), space y_2 (x) = e^(-2x)
$

また、 

$
W_0 = y_1(0) y'_2(0) - y_2(0)y'_1(0) = -4
$

$
G(x, x') &= -1/4 (e^(-2x) e^(2x') - e^(2x) e^(-2x')) e^0 \
         &= -1/4 (e^(2(x' - x)) - e^(2(x - x')))
$

となる。

=== (1)

特解は、

$
Y(x)
&= -1/4 integral^x ( e^(2(x' - x)) - e^(2(x - x')) ) dd(x') \
&= -1/4 [ 1/2 e^(2(x' - x)) + 1/2 e^(2(x - x')) ]^x \
&= -1/4 (1/2 + 1/2) \
&= -1/4
$

=== (2)

特解は、

$
Y(x)
&= -1/4 integral^x ( e^(2(x' - x)) - e^(2(x - x')) ) x' dd(x') \
&= -1/4 { [(1/2 e^(2(x' - x)) + 1/2 e^(2(x - x')) ) x']^x - integral^x ( 1/2 e^(2(x' - x)) + 1/2 e^(2(x - x')) ) dd(x') } \
&= -1/4 { ( 1/2 + 1/2 )x - [1/4 e^(2(x' - x)) - 1/4 e^(2(x - x'))]^x } \
&= -x/4
$

=== (3)

特解は、

$
Y(x)
&= -1/4 integral^x ( e^(2(x' - x)) - e^(2(x - x')) ) sin x' dd(x') \
&= -1/4 { 1/2[(e^(2(x' - x)) + e^(2(x - x')) ) sin x']^x - 1/2 integral^x (e^(2(x' - x)) + e^(2(x - x'))) cos x' dd(x') } \
&= -1/4 { sin x - 1/2 integral^x (e^(2(x' - x)) + e^(2(x - x'))) cos x' dd(x') } \
&= -1/4 { sin x - 1/2 { 1/2 [(e^(2(x' - x)) - e^(2(x - x'))) cos x']^x + 1/2 integral^x (e^(2(x' - x)) - e^(2(x - x'))) sin x'dd(x') }} \
&= -1/4 { sin x - 1/4 integral^x (e^(2(x' - x)) - e^(2(x - x'))) sin x'dd(x') } \
&= -1/4 { sin x + Y(x) } \

therefore Y(x) &= -1/5 sin x 
$

=== (4)

特解は、

$
Y(x)
&= -1/4 integral^x ( e^(2(x' - x)) - e^(2(x - x')) ) cos x' dd(x') \
&= -1/4 { 1/2[(e^(2(x' - x)) + e^(2(x - x')) ) cos x']^x + 1/2 integral^x (e^(2(x' - x)) + e^(2(x - x'))) sin x' dd(x') } \
&= -1/4 { cos x + 1/2 integral^x (e^(2(x' - x)) + e^(2(x - x'))) sin x' dd(x') } \
&= -1/4 { cos x + 1/2 { 1/2 [(e^(2(x' - x)) - e^(2(x - x'))) sin x']^x - 1/2 integral^x (e^(2(x' - x)) - e^(2(x - x'))) cos x'dd(x') }} \
&= -1/4 { cos x - 1/4 integral^x (e^(2(x' - x)) - e^(2(x - x'))) cos x'dd(x') } \
&= -1/4 { cos x + Y(x) } \

therefore Y(x) &= -1/5 cos x 
$

=== (5)

特解は、

$
Y(x)
&= -1/4 integral^x ( e^(2(x' - x)) - e^(2(x - x')) ) e^(2x') dd(x') \
&= -1/4 integral^x (e^(4x' - 2x) - e^(2x)) dd(x') \
&= -1/4 [ 1/4 e^(4x' - 2x) - e^(2x) x' ]^x \
&= -1/4 ( 1/4 e^(2x) - e^(2x) x) \
&= 1/4 e^(2x) (x - 1/4)
$

=== (6)

特解は、

$
Y(x)
&= -1/4 integral^x ( e^(2(x' - x)) - e^(2(x - x')) ) e^(-2x') dd(x') \
&= -1/4 integral^x (e^(4x' - 2x) - e^(2x)) dd(x') \
&= -1/4 [ e^(-2x) x' + 1/4 e^(2x - 4x') ]^x \
&= -1/4 (e^(-2x) x + 1/4 e^(-2x)) \
&= -1/4 e^(2x) (x + 1/4)
$

== 問題2

=== (1)

特解 $Y(x) = a x + b$ とおく。

$
0 - 4(a x + b) = 1 => -4 a x - 4 b = 1 => a = 0, space b = -1/4
$

よって、

$
Y(x) = -1/4
$

=== (2)

特解 $Y(x) = a x + b$ とおく。

$
0 - 4(a x + b) = x => -4 a x - 4 b = x => a = -1/4, space b = 0
$

よって、

$
Y(x) = -1/4x
$

=== (3)

特解 $Y(x) = a cos x + b sin x$ とおく。

$
(- a cos x - b sin x) - 4(a cos x + b sin x) = sin x \
=> -5 a cos x -5 b sin x = sin x \
=> a = 0, space b = -1/5
$

よって、

$
Y(x) = -1/5 sin x
$

=== (4)

特解 $Y(x) = a cos x + b sin x$ とおく。

$
(- a cos x - b sin x) - 4(a cos x + b sin x) = cos x \
=> -5 a cos x -5 b sin x = cos x \
=> a = -1/5, space b = 0
$

よって、

$
Y(x) = -1/5 cos x
$

=== (5)

特解 $Y(x) = a x e^(2 x)$ とおく。

$
4 a e^(2 x) + 4 a x e^(2 x) - 4 a x e^(2 x) = e^(2 x) \
=> 4 a e^(2 x) = e^(2 x) \
=> a = 1 / 4
$

よって、

$
Y(x) = 1/4 x e^(2x)
$

=== (6)

特解 $Y(x) = a x e^(-2 x)$ とおく。

$
-4 a e^(-2 x) + 4 a x e^(-2 x) - 4 a x e^(-2 x) = e^(-2 x) \
=> -4 a e^(2 x) = e^(-2 x) \
=> a = -1 / 4
$

よって、

$
Y(x) = -1/4 x e^(-2x)
$

== 問題3

=== (1)

特性方程式は、$lambda^2 - 4 lambda + 3 = 0$ である。

この解は、実数解 2 つ $lambda = 1,3$ である。

これにより、一般解は、

$
y(x) = a e^x + b e^(3 x)
$

初期条件 $y(0) = 0, space y'(0) = 2$ を考えると、

$
y(0)  &= a + b = 0 \
y'(0) &= a + 3b = 2
$

よって、$a = -1, space b = 1$ であるから、求める解は、

$
y(x) = - e^x + e^(3 x)
$

=== (2)

特性方程式は、$lambda^2 + 2 lambda + 2 = 0$ である。

この解は、複素数解 2 つ $lambda = -1 plus.minus i$ である。

これにより、一般解は、

$
y(x) = e^(-1) (a cos x + b sin x)
$

初期条件 $y(0) = 1, space y'(0) = 1$ を考えると、

$
y(0)  &= a e^(-1) = 1 \
y'(0) &= b e^(-1) = 1
$

よって、$a = e, space b = e$ であるから、求める解は、

$
y(x) = cos x + sin x
$

=== (3)

特解を $Y(x) = a x + b$ とおくと、

$
0 - (a x + b) = x => -a x - b = x => a = -1, space b = 0
$

よって、特解は $Y(x) = -x$

一般解は、

$
y(x) = c_1 e^x + c_2 e^(-x) - x
$

初期条件 $y(0) = 1, space y'(0) = 0$ を考えると、

$
y(0)  &= c_1 + c_2  = 1 \
y'(0) &= c_1 - c_2 - 1 = 0
$

よって、$c_1 = 1, space c_2 = 0$ であるから、求める解は、

$
y(x) = e^x - x
$

=== (4)


特解を $Y(x) = a x + b$ とおくと、

$
0 + (a x + b) = x => a x + b = x => a = 1, space b = 0
$

よって、特解は $Y(x) = x$


一般解は、

$
y(x) = c_1 cos x + c_2 sin x + x
$

初期条件 $y(0) = 1, space y'(0) = 2$ を考えると、

$
y(0)  &= c_1  = 1 \
y'(0) &= c_2 + 1 = 2
$

よって、$c_1 = 1, space c_2 = 1$ であるから、求める解は、

$
y(x) = cos x + sin x + x
$
