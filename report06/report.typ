#import "../template.typ": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/physica:0.9.2": *

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第6回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 11 月 14 日",
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
=== (2)
=== (3)
=== (4)

