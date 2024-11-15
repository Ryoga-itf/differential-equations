#import "../template.typ": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/physica:0.9.2": *

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第6回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 11 月 15 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

== 問題1

=== (1)

与えられた微分方程式を変形すると、

$
y'' - 1/x y' + 1/x^2 y = 0
$

$y_1(x) = x$ が解であることは、

$
0 - 1/x + x/x^2 = 0
$

より確認可。

公式に $p(x) = -1/x$ を代入すると、

$
y_2(x)
&= x( integral^x dd(x') / x'^2  exp ( integral^x' dd(x'')/x'' ) + C) \
&= x( integral^x dd(x') / x'^2  exp ( [ log x'' ]^x' ) + C) \
&= x( integral^x dd(x') / x'^2  exp ( log x' ) + C) \
&= x( integral^x dd(x') / x' + C) \
&= x( [log x']^x + C) \
&= x log x + C x
$

である。$C x$ は $y_1(x)$ に含まれるので、$y_2(x) = x log x$ である。

=== (2)

与えられた微分方程式を変形すると、

$
y'' + 1/x y' - 1/x^2 y = 0
$

$y_1(x) = x$ が解であることは、

$
0 + 1/x - x/x^2 = 0
$

より確認可。

公式に $p(x) = 1/x$ を代入すると、

$
y_2(x)
&= x( integral^x dd(x') / x'^2  exp ( -integral^x' dd(x'')/x'' ) + C) \
&= x( integral^x dd(x') / x'^2  exp ( -[ log x'' ]^x' ) + C) \
&= x( integral^x dd(x') / x'^2  exp ( -log x' ) + C) \
&= x( integral^x dd(x') / x'^3 + C) \
&= x( [ -1/2 x'^(-2) ]^x + C) \
&= -1/(2x) + C x
$

である。$C x$ は $y_1(x)$ に含まれるので、
$
y_2(x) = -1/(2x)
$
である。

=== (3)

与えられた微分方程式を変形すると、

$
y'' + 2/x y' + y = 0
$

$y_1(x) = (cos x) / x$ が解であることは、

$
((cos x) / x)'  &= - (x sin x + cos x) / x^2 \
((cos x) / x)'' &= (- x^2 cos x + 2 x sin x + 2 cos x) / x^3
$

であるから、

$
& ((cos x) / x)'' + 1/x ((cos x) / x)' - (cos x) / x \
&= - (cos x) / x + (2 sin x) / x^2 + (2 cos x) / x^3 - (2 sin x) / x^2 + (2 cos x) / x^3 + (cos x) / x \
&= 0
$

より確認可。

公式に $p(x) = 2/x$ を代入すると、

$
y_2(x)
&= (cos x) / x ( integral^x dd(x') / (y_1^2 (x'))  exp ( - 2integral^x' dd(x'')/x'' ) + C) \
&= (cos x) / x ( integral^x dd(x') / (y_1^2 (x'))  exp ( - 2 log x' ) + C) \
&= (cos x) / x ( integral^x dd(x') / ((cos x') / x')^2  1/x'^2 + C) \
&= (cos x) / x ( integral^x x'^2 / cos^2 x'  1/x'^2 + C) \
&= (cos x) / x ( integral^x 1 / cos^2 x' + C) \
&= (cos x) / x tan x + C (cos x) / x \
&= (sin x) / x + C (cos x) / x \
$

である。$C (cos x) / x$ は $y_1(x)$ に含まれるので、

$
y_2(x) = (sin x) / x
$
である。

=== (4)

与えられた微分方程式を変形すると、

$
y'' - (1 + x) / x y' + 1/x y = 0
$

$y_1(x) = 1 + x$ が解であることは、

$
0 - (1 + x) / x + 1/x (1 + x) = 0
$

より確認可。

公式に $p(x) = -(1 + x) / x$ を代入すると、

$
y_2(x)
&= (1 + x) ( integral^x dd(x') / (1 + x')^2  exp ( integral^x' (1 + x'')/x'' dd(x'') ) + C) \
&= (1 + x) ( integral^x dd(x') / (1 + x')^2  exp ( log x' + x' ) + C) \
&= (1 + x) ( integral^x (x' e^(x')) / (1 + x')^2 dd(x') + C)\
&= (1 + x) ( e^x / (x + 1) + C)\
&= e^x + C (1 + x)\
$

である。$C (1 + x)$ は $y_1(x)$ に含まれるので、$y_2(x) = e^x$ である。

== 問題2

=== (1)

$
W(1, x^2) &= 2x \
G(x, x')  &= 1/(2x') (x^2 - x'^2) = 1/2 (x^2 / x' - x')
$

である。$r(x') = 2x'$ とすると特解は、

$
Y(x) &= integral^x G(x, x') r(x') dd(x') \
     &= integral^x (x^2 / x' - x') x' dd(x') \
     &= integral^x (x^2 / x' - x') x' dd(x') \
     &= 2/3 x^3 \
$

よって、$c_1, c_2$ を任意の定数とおくと一般解は、

$
y(x) = c_1 + c_2 x^2 + 2/3 x^3
$

=== (2)

$
W(x, x^3) &= x dot 3 x^2 - x^3 dot 1 = 2x^3 \
G(x, x')  &= 1/(2x'^3) (x^3 x' - x x'^3) = 1/2 (x^3/x'^2 - x)
$

である。$r(x') = x'^2 e^x'$ とすると特解は、

$
Y(x) &= integral^x G(x, x') r(x') dd(x') \
     &= integral^x 1/2(x^2 / x' - x') x'^2 e^x' dd(x') \
     &= 1/2 [ e^x' ( x^2 (x' - 1) - x'^3 + 3x'^2 - 6x' + 6 ) ]^x \
     &= e^x ( x^2 - 3x + 3 ) \
$

よって、$c_1, c_2$ を任意の定数とおくと一般解は、

$
y(x) = c_1 x + c_2 x^3 + e^x ( x^2 - 3x + 3 )
$

=== (3)

$
W(x^2, 1/x) &= x^2 dot (-1/x^2) - 1/x dot 2 x = -3 \
G(x, x')    &= -1/3 (x^2 / x' - x'^2 / x)
$

である。$r(x') = x'^2$ とすると特解は、

$
Y(x) &= integral^x G(x, x') r(x') dd(x') \
     &= integral^x -1/3 (x^2 / x' - x'^2 / x) x'^2 dd(x') \
     &= -1/3 integral^x (x^2 x' - x'^4 / x) dd(x') \
     &= -1/3 [ 1/2 x^2 x'^2 - 1/5 x'^5 / x ]^x \
     &= -1/3 (1/2 x^4 - 1/5 x^4) \
     &= -1/10 x^4 \
$

よって、$c_1, c_2$ を任意の定数とおくと一般解は、

$
y(x) = c_1 x^2 + c_2 / x - 1/10 x^4
$

=== (4)

$
W(x, 1/x) &= x dot (-1/x^2) - 1/x = -2/x\
G(x, x')  &= - x/2 (x'/x - x/x') = -1/2 (x' - x^2/x')
$

である。$r(x') = 2x'^3 + 4x' = 2x'(x'^2 + 2)$ とすると特解は、

$
Y(x) &= integral^x G(x, x') r(x') dd(x') \
     &= integral^x (x^2 - x'^2 ) (x'^2 + 2) dd(x') \
     &= [ 1/3 (x^2 - 2) x'^3 + 2 x^2 x' - x'^5 / 5 ]^x \
     &= 2/15 x^5 + 4/3 x^3 \
$

よって、$c_1, c_2$ を任意の定数とおくと一般解は、

$
y(x) = c_1 x + c_2 /x + 2/15 x^5 + 4/3 x^3
$
