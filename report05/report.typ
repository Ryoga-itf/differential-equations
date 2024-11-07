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

== 問題3
