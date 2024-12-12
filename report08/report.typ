#import "../template.typ": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/physica:0.9.2": *

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第8回",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：情報科学類"),
  ),
  date: "2024 年 12 月 13 日",
)

#show math.equation: set text(font: ("New Computer Modern Math", "Noto Serif", "Noto Serif CJK JP"))

== 問題1

=== (1)

形式解を $y = x^k sum^(infinity)_(n=0) c_n x^n$ とおくと、

$
y   &= sum^(infinity)_(n=0) c_n x^(n+k) \
y'  &= sum^(infinity)_(n=0) (n+k) c_n x^(n+k-1) \
y'' &= sum^(infinity)_(n=0) (n+k)(n+k-1) c_n x^(n+k-2) \
$

これを与えられた微分方程式に代入すると、

$
x sum^(infinity)_(n=0) (n+k)(n+k-1) c_n x^(n+k-2)
  + (x + 2) sum^(infinity)_(n=0) (n+k) c_n x^(n+k-1)
  + sum^(infinity)_(n=0) c_n x^(n+k)
  = 0 \
=> 
  sum^(infinity)_(n=0) (n+k)(n+k-1) c_n x^(n+k-1)
  + sum^(infinity)_(n=0) (n+k) c_n x^(n+k)
  + sum^(infinity)_(n=0) 2(n+k) c_n x^(n+k-1)
  + sum^(infinity)_(n=0) c_n x^(n+k)
  = 0 \
=> 
  sum^(infinity)_(n=0) {(n+k)(n+k-1) c_n x^(n+k-1) + 2(n+k) c_n x^(n+k-1)}
  + sum^(infinity)_(n=0) { (n+k) c_n x^(n+k) + c_n x^(n+k) }
  = 0 \
=> 
  sum^(infinity)_(n=0) (n+k+1)(n+k)c_n x^(n+k-1)
  + sum^(infinity)_(n=0) (n+k+1) c_n x^(n+k)
  = 0 \
=> 
  sum^(infinity)_(n=0) (n+k+1)(n+k)c_n x^(n+k-1)
  + sum^(infinity)_(n=1) (n+k) c_(n-1) x^(n+k-1)
  = 0 \
=> 
  k(k+1) c_0 x^(k-1)
  + sum^(infinity)_(n=1) (n+k+1)(n+k)c_n x^(n+k-1)
  + sum^(infinity)_(n=1) (n+k) c_(n-1) x^(n+k-1)
  = 0 \
=> 
  k(k+1) c_0 x^(k-1)
  + sum^(infinity)_(n=1) {(n+k+1)c_n + c_(n-1)} (n+k) x^(n+k-1)
  = 0 \
$

$x^(k-1)$ の係数が $0$ になるようにすると、指数 $k$ は $k = 0, -1$ となる。

$k = 0$ のとき、
漸化式は

$
(n+1)c_n + c_(n-1) = 0 <=> c_n = -1/(n+1) c_(n-1)
$

よって、$alpha = c_0$ とおくことにより

$
c_n = (-1/(n+1))(-1/n)dots.c(-1/2) c_0 = (-1)^n/(n+1)! alpha
$

これを形式解 $y = x^k sum^(infinity)_(n=0) c_n x^n$ に代入することにより、

$
y_1 &= x^0 sum^(infinity)_(n=0) (-1)^n/(n+1)! alpha x^n \
  &= alpha sum^(infinity)_(n=0) (-x)^n/(n+1)! \
  &= -alpha/x sum^(infinity)_(n=0) (-x)^(n+1)/(n+1)! \
  &= -alpha/x (sum^(infinity)_(n=0) (-x)^n/n! - 1) \
  &= -alpha/x (e^(-x) - 1) \

$

$k = -1$ のとき、
漸化式は

$
n c_n + c_(n-1) = 0 <=> c_n = -1/n c_(n-1)
$

よって、$beta = c_0$ とおくことにより

$
c_n = (-1/n)(-1/(n-1))dots.c(-1/1)c_0 = (-1)^n/n! beta
$

これを形式解 $y = x^k sum^(infinity)_(n=0) c_n x^n$ に代入することにより、

$
y_2 &= x^(-1) sum^(infinity)_(n=0) (-1)^n/n! beta x^n \
  &= beta/x sum^(infinity)_(n=0) (-x)^n/n! \
  &= beta/x e^(-x)
$

基本解は、$y = y_1 + y_2$ と表されるから、

$
y &= -alpha/x (e^(-x) - 1) + beta/x e^(-x) \
  &= 1/x (-alpha e^(-x) + beta e^(-x) + alpha) \
  &= 1/x (alpha + (-alpha + beta) e^(-x)) \
$

$alpha = a, b = -alpha + beta = -a + beta$ とおくと、

$
y = 1/x (a + b e^(-x))
$

よって、一般解は与えられたものに一致することが確認できた。

=== (2)

形式解を $y = x^k sum^(infinity)_(n=0) c_n x^n$ とおくと、

$
y   &= sum^(infinity)_(n=0) c_n x^(n+k) \
y'  &= sum^(infinity)_(n=0) (n+k) c_n x^(n+k-1) \
y'' &= sum^(infinity)_(n=0) (n+k)(n+k-1) c_n x^(n+k-2) \
$

これを与えられた微分方程式に代入すると、

$
x^2 (sum^(infinity)_(n=0) (n+k)(n+k-1) c_n x^(n+k-2))
  + x sum^(infinity)_(n=0) (n+k) c_n x^(n+k-1)
  + (x^2 - 1/4) sum^(infinity)_(n=0) c_n x^(n+k)
  = 0 \
=>
  sum^(infinity)_(n=0) (n+k)(n+k-1) c_n x^(n+k)
  + sum^(infinity)_(n=0) (n+k) c_n x^(n+k)
  + sum^(infinity)_(n=0) c_n x^(n+k+2)
  + sum^(infinity)_(n=0) -1/4 c_n x^(n+k)
  = 0 \
=>
  sum^(infinity)_(n=0) {(n+k)(n+k-1) c_n x^(n+k) + (n+k) c_n x^(n+k) -1/4 c_n x^(n+k)}
  + sum^(infinity)_(n=0) c_n x^(n+k+2)
  = 0 \
=>
  sum^(infinity)_(n=0) {(n+k)(n+k-1) + (n+k) -1/4} c_n x^(n+k)
  + sum^(infinity)_(n=0) c_n x^(n+k+2)
  = 0 \
=>
  sum^(infinity)_(n=0) ((n+k)^2 -1/4) c_n x^(n+k)
  + sum^(infinity)_(n=2) c_(n-2) x^(n+k)
  = 0 \
=>
  (k^2 - 1/4) c_0 x^k
  + ((k+1)^2 - 1/4) c_1 x^(k+1)
  + sum^(infinity)_(n=2) ((n+k)^2 -1/4) c_n x^(n+k)
  + sum^(infinity)_(n=2) c_(n-2) x^(n+k)
  = 0 \
=>
  (k^2 - 1/4) c_0 x^k
  + ((k+1)^2 - 1/4) c_1 x^(k+1)
  + sum^(infinity)_(n=2) {((n+k)^2 -1/4) c_n + c_(n-2)} x^(n+k)
  = 0 \
$

$x^(k)$ の係数が $0$ になるようにすると、指数 $k$ は $k = plus.minus 1/2$ となる。

$k = 1/2$ のとき、$x^(k+1)$ の係数は $2 c_1$ となるから $c_1 = 0$ となる必要がある。

漸化式は

$
((n+1/2)^2 - 1/4)c_n + c_(n-2) = 0 \
=> (n^2 + n)c_n + c_(n-2) = 0 \
therefore c_n = -1/(n^2 + n)c_(n-2)
$

$n$ が偶数であるとき、$n = 2 m$ とおくと、

$
c_n = (-1/(n^2 + n)) (-1/((n-2)^2 + (n-2))) dots.c (-1/(2^2 + 2))c_0 \
=> c_n = (-1/((n + 1)n)) (-1/((n-1)(n-2))) dots.c (-1/(3 dot 2))c_0 \
$

$
=> c_(2m) = (-1/((2m + 1)2m)) (-1/((2m-1)(2m-2))) dots.c (-1/(3 dot 2))c_0 \
=> c_(2m) = (-1)^m (1/((2m + 1)2m)) (1/((2m-1)(2m-2))) dots.c (1/(3 dot 2))c_0 \
=> c_(2m) = (-1)^m / ((2m + 1)!) c_0 \
$

$n$ が奇数であるとき、

$
c_n = (-1/(n^2 + n)) (-1/((n-2)^2 + (n-2))) dots.c (-1/(3^2 + 3))c_1 = 0
$

$k = -1/2$ のとき、$x^(k+1)$ の係数は常に $0$ となる。

漸化式は

$
((n-1/2)^2 - 1/4)c_n + c_(n-2) = 0 \
=> (n^2 - n)c_n + c_(n-2) = 0 \
therefore c_n = -1/(n^2 - n)c_(n-2) \
$

=== (3)
=== (4)

== 問題2

=== (1)
=== (2)
=== (3)

== 問題3
