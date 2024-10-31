#let frac(n, m: 1) = {
  (n: n, m: m)
}

#let display_frac(f, display_sign: false) = {
  let g = calc.gcd(calc.abs(f.n), calc.abs(f.m))
  let res = f.n / f.m
  let sign = if (res < 0) { $-$ } else if (res == 0) { $$ } else { $+$ }
  if (g == calc.abs(f.m)) {
    if (display_sign) {
      $#sign #calc.abs(res)$
    } else {
      $#res$
    }
  } else {
    if (not display_sign) {
      if (res > 0) {
        sign = $$
      }
    }
    $sign #calc.abs(f.n / g) / #calc.abs(f.m / g)$
  }
}

#let add_frac(f1, f2) = {
  let n = f1.n * f2.m + f2.n * f1.m
  let m = f1.m * f2.m
  let g = calc.gcd(n, m)
  (n: int(n / g), m: int(m / g))
}

#let sub_frac(f1, f2) = {
  let n = f1.n * f2.m - f2.n * f1.m
  let m = f1.m * f2.m
  let g = calc.gcd(n, m)
  (n: int(n / g), m: int(m / g))
}

#let mul_frac(f1, f2) = {
  let n = f1.n * f2.n
  let m = f1.m * f2.m
  let g = calc.gcd(n, m)
  (n: int(n / g), m: int(m / g))
}

#let div_frac(f1, f2) = {
  let n = f1.n * f2.m
  let m = f1.m * f2.n
  let g = calc.gcd(n, m)
  (n: int(n / g), m: int(m / g))
}

#let sqrt_frac(f) = {
  let n = int(calc.sqrt(f.n))
  let m = int(calc.sqrt(f.m))
  (n: n, m: m)
}

#let abs_frac(f) = {
  (n: calc.abs(f.n), m: calc.abs(f.m))
}
