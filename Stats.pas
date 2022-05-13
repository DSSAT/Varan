unit Stats;

interface

function MeanN(var D: array of double; n: integer): double;
function VarianceN(var D: array of double; n: integer): double;
function StdDevN(var D: array of double; n: integer): double;
function MedianN(var D: array of double; n: integer): double;
function Median(D: array of double): double;
procedure MedMAD(D: array of double; var Med, MAD: double);
procedure Biweight(D: array of double; const C: double; var Mn, SD: extended);
procedure Standardize(var D: array of double; Mn, SD: double);
function BetaInv(const p, a, b: double): double;
function Erf(const x: double): double;
procedure Tukey (var Dat: array of real;var N: integer; var Pars: array of real; var error: integer);
procedure ERIC (var g: array of real; var n: integer);
procedure Condes (var A: array of real; var n: integer; var XM: array of real);
FUNCTION GINI (var DAT: array of real; var n: integer): real;

implementation

uses Math, Dialogs;

FUNCTION GINI (var DAT: array of real; var n: integer): real;
var
  I,J    : integer;
  GIN,ZN : real;
begin
  GIN := 0.0;
  IF (N >= 2) THEN
  begin
    ERIC (DAT,N);
    for i := 1 to n-1 do
      for j := i+1 to n do
          GIN := GIN + (DAT[j]-DAT[i]);
    ZN   := N;
    GINI := (GIN/(ZN*(ZN-1)/2.0))/2.0;
  end;
end;

procedure CONDES (var A: array of real; var n: integer; var XM: array of real);
var
  I,J : integer;
  ZHI,ZLO,ZN : real;
  Y   : array[1..4] of real;
begin
  for i := 0 to 9 do xm[i] := 0;
  for i := 1 to 4 do y [i] := 0;
  ZHI := -1.0E10;
  ZLO :=  1.0E10;
  if (N <= 0) then exit;

  for i := 1 to n do
  begin
    if (a[I] > ZHI) then ZHI := a[i];
    if (a[I] < ZLO) then ZLO := a[i];
    for j := 1 to 4 do
    begin
      Y[J] := Y[J] + Power (a[I],j);
    end;
  end;

  ZN     := N;

  XM[1] := Y[1]/ZN;
  XM[7] := ZHI;
  XM[6] := ZLO;
  if (ZHI = ZLO) or (N = 1) then exit;

  XM[2] := (Y[2]*ZN-Power (Y[1],2))/(ZN*(ZN-1.0));
  XM[3] := (Y[3]/ZN)-3.0*(Y[2]/ZN)*XM[1]+2.0*Power (XM[1],3);
  XM[4] := (Y[4]/ZN)-4.0*XM[1]*(Y[3]/ZN)+6.0*(Power(XM[1],2))*(Y[2]/ZN)-3.0*Power (XM[1],4);
  XM[8] := XM[3]/SQRT(Power (XM[2],3));
  XM[9] := XM[4]/Power (XM[2],2);
  XM[5] := SQRT(XM[2]);
end;

procedure Tukey (var Dat: array of real;var N: integer; var Pars: array of real; var error: integer);
var
  i,j       : integer;
  ix        : array[1..5]   of integer;
  cp        : array[1..5000] of real;
  zinc      : real;
  xm        : array[0..9] of real;
  Perc      : array[1..5]   of real;
begin
  Perc[1] := 0.10; Perc[2] := 0.25; Perc[3] := 0.50;
  Perc[4] := 0.75; Perc[5] := 0.90;

  Error := 0;
  if (N <= 0) then
     Error := 1;

  if (N = 1) then
  begin
    for i := 1 to 9 do
       Pars[i] := Dat[1];
    Pars[2] := 0.0;
    exit;
  end;

  IF (Error <> 0) then Exit;
  Eric (Dat,n);

  Condes (Dat,N,XM);

  for i := 1 to 5 do ix[i] := 0;

  CP[1] := 0.0;
  Zinc  := 1.0/int(N-1);

  for i := 2 to n do
  begin
    CP[I] := CP[I-1] + Zinc;
    for j := 1 to 5 do
      if (IX[J] <= 0) and (CP[I] >= PERC[J]) then IX[J] := I;

  end;

  PARS[1] := XM[1];
  PARS[2] := XM[5];
  PARS[3] := XM[6];

  for j := 1 to 5 do
      PARS[J+3] := ((PERC[J]-CP[IX[J]-1]))/(CP[IX[J]]-CP[IX[J]-1])*
                    (Dat[IX[J]]-Dat[IX[J]-1])+Dat[IX[J]-1];

  PARS[9] := XM[7];

end;

procedure ERIC (var g: array of real; var n: integer);
var
  i,j,gap,switch : INTEGER;
  t : real;
begin
  if (N < 1) or (n > 16384) then
     Showmessage ('Size problem in ERIC!');
  gap := N;
  switch := 0;

  while true do
  begin
    IF (switch = 0) and (GAP = 1) then Exit;
    GAP    := MAX(Trunc(GAP/1.3),1);
    switch := 0;

    for i := 1 to n - gap do
    begin
      J := I + GAP;
      if (g[i] > g[J]) then
      begin
        T      := g[i];
        g[i]   := g[j];
        g[j]   := T;
        switch := switch + 1;
      end;
    end;
  end;
end;

function MeanN;
var
  x : double;
  i : integer;
begin
  x := 0.0;
  for i := 0 to Pred(n) do
    x := x + D[i];
  Result := x / n;
end;

function VarianceN;
var
  x, xBar: double;
  i: integer;
begin
  xBar := -MeanN(D, n);
  x := 0.0;
  for i := 0 to Pred(n) do
    x := x + (xBar + D[i]) * (xBar + D[i]);
  Result := x / n;
end;

function StdDevN;
begin
  Result := sqrt(VarianceN(D, n));
end;

function MedianN;
{ Press et al., 1989. Numerical Recipies... }

  procedure ShellSort;
  { O'Brien & Nameroff, 1993. Turbo Pascal 7: The Complete Reference }
  var
    Gap, i, j, k: Integer;

    procedure Swap(var A, B: double);
    var
      C: double;
    begin
      C := A;
      A := B;
      B := C;
    end;

  begin
    Gap := n div 2;
    while Gap > 0 do
    begin
      for i := Gap to Pred(n) do
      begin
        j := i - Gap;
        while j >= 0 do
        begin
          k := j + Gap;
          if D[j] <= D[k] then
            j := -1
          else
          begin
            Swap(D[j], D[k]);
            Dec(j, Gap);
          end; { else }
        end; { while }
      end; { for }
      Gap := Gap div 2;
    end; { while }
  end;

var
   n2: word;
begin { Median }
   ShellSort;
   n2 := n div 2;
   if (2 * n2 = n) then
     Result := 0.5 * (D[Pred(n2)] + D[n2])
   else
     Result := D[n2];
end;

function Median;
{ Press et al., 1989. Numerical Recipies... }
var
  n: integer;

  procedure ShellSort;
  { O'Brien & Nameroff, 1993. Turbo Pascal 7: The Complete Reference }

    procedure Swap(var A, B: double);
    var
      C: double;
    begin
      C := A;
      A := B;
      B := C;
    end;

  var
    Gap, i, j, k: integer;
  begin
    Gap := n div 2;
    while Gap > 0 do
    begin
      for i := Gap to Pred(n) do
      begin
        j := i - Gap;
        while j >= 0 do
        begin
          k := j + Gap;
          if D[j] <= D[k] then
            j := -1
          else
          begin
            Swap(D[j], D[k]);
            Dec(j, Gap);
          end; { else }
        end; { while }
      end; { for }
      Gap := Gap div 2;
    end; { while }
  end; { procedure ShellSort }

var
  n2: integer;
begin { Median }
  n := Length(D);
  if n = 1 then
  begin
    Result := D[0];
    Exit;
  end;
  n2 := n div 2;
  ShellSort;
  if (2 * n2 = n) then
    Result := 0.5 * (D[Pred(n2)] + D[n2])
  else
    Result := D[n2];
end;

procedure MedMAD;
var
  i : integer;
begin
  Med := -Median(D);
  for i := 0 to pred(Length(D)) do
    D[i] := abs(D[i] + Med);
  Med := -Med;
  MAD := Median(D);
end;

procedure Biweight;
var
  i, n: integer;
  U: array of double;
  InvCMAD, Numer, Denom, Dummy, M, MAD: double;
begin
  n := Length(D);
  if n = 1 then
  begin
    Mn := D[0];
    SD := 0.0;
    Exit;
  end;
  SetLength(U, n);
  MedMad(D, M, MAD);
  InvCMAD := 1.0 / (C * MAD);  { divide by zero possible }
  M := -M;
  for i := 0 to pred(n) do
  begin
    D[i] := D[i] + M;
    U[i] := D[i] * InvCMAD;
    if abs(U[i]) >= 1.0 then
      U[i] := 0.0;
  end; { for }
  M := -M;
  Numer := 0.0;
  Denom := 0.0;
  for i := 0 to pred(n) do
    if U[i] <> 0.0 then
    begin
      Dummy := sqr(1.0 - sqr(U[i]));
      Numer := Numer + D[i] * Dummy;
      Denom := Denom + Dummy;
    end;
  Mn := M + Numer / Denom;
  Numer := 0.0;
  Denom := 0.0;
  for i := 0 to pred(n) do
    if U[i] <> 0.0 then
    begin
      Dummy := -sqr(U[i]);
      Numer := Numer + sqr(D[i]) * IntPower(1.0 + Dummy, 4);
      Denom := Denom + (1.0 + Dummy) * (1.0 + 5.0 * Dummy);
    end;
  SD := sqrt(n * Numer) / abs(Denom);
  Finalize(U);
end;

procedure Standardize;
var
  i: integer;
begin
  if SD > 0.0 then
    SD := 1.0 / SD
  else
    SD := 1.0;
  Mn := -Mn;
  for i := 0 to pred(Length(D)) do
    D[i] := (D[i] + Mn) * SD;
end;

function GammaLn(const xx: double): double;
{ Press et al., 1989. Numerical Recipes, Cambridge }
const
  stp = 2.50662827465;
  fpf = 5.5;
  cof: array[1..6] of double = (76.18009173, -86.50532033, 24.01409822, -1.231739516, 0.120858003e-2, -0.536382e-5);
var
  x, tmp, ser: double;
  j: integer;
begin
  x := xx - 1.0;
  tmp := x + fpf;
  tmp := (x + 0.5) * ln(tmp) - tmp;
  ser := 1.0;
  for j := 1 to 6 do
  begin
    x := x + 1.0;
    ser := ser + cof[j] / x;
  end;
  Result := tmp + ln(stp * ser);
end;

function BetaInv;
{
Adapted from IMSL routine MDBETI.
}
  procedure MDBeta(const X, A, B: double; var P: double; var IER: integer);
  {
  Adapted from IMSL routine MDBETA.
  }
  const
    eps = 0.1192093e-6;
    eps1 = 0.9860757e-32;
    aleps = -73.696745;
  var
    aa, bb, c, cnt, d4, da, db, p1, pq, ps, px, temp, tot, wh, xb, xint, y: double;
    ib, int1: integer;
  LABEL
    40, 45, 50, 55;
  begin
    y := x;
    IER  :=  0;
    if (x > 1.0) or (x < 0.0) then
      IER  :=  129
    else if (A <= 0.0) or (B <= 0.0) then
      IER := 130
    else
    begin
      aa := a;
      bb := b;
      if x > 0.5 then
      { switch arguments for more efficient use of the power series }
      begin
        int1 := 1;
        temp := aa;
        aa := bb;
        bb := temp;
        y := 1.0 - y;
      end
      else
        int1 := 0;
      if (x = 0.0) or (x = 1.0) then
        p := 0.0
      else
      begin
        temp := floor(bb);
        ps := bb - temp;
        if (bb = temp) then
          ps := 1.0;
        da := aa;
        db := bb;
        px := da * ln(y);
        d4 := ln(da);
        pq := gammaln(da + db);
        p1 := gammaln(da);
        c := gammaln(db);
        xb := px + gammaln(ps + da) - gammaln(ps) - d4 - p1;
        { scaling: }
        ib := trunc(xb / aleps);
        xint := 0.0;
        { first term of a decreasing series will underflow }
        if (ib = 0) then
        begin
          xint := exp(xb) * 1.0e10;
          cnt := xint * da;
          { cnt will equal dexp(temp) * (1.d0 - ps)i *  }
          { p * y *  * i / factorial(i) }
          wh := 0.0;
          repeat
            wh := wh + 1.0;
            cnt := cnt * (wh - ps) * y / wh;
            xb := cnt / (da + wh);
            xint := xint + xb;
          until (xb / eps <= xint);
          xint := xint * 1.0e-10;
        end; { if } 
        tot := 0.0;
        if (db <= 1.0) then goto 55;
        xb := px + db * ln(1.0 - y) + pq - p1 - ln(db) - c;
        { scaling }
        temp := max(floor(xb / aleps), 0.0);
        c := 1.0 / (1.0 - y);
        ps := temp;
        cnt := exp(xb - ps * aleps);
        ps := db;
        wh := db;
  40:   wh := wh - 1.0;
        if (wh <= 0.0) then goto 55;
        px := (ps * c) / (da + wh);
        if (px > 1.0) then goto 45;
        if (cnt / eps <= tot) or (cnt <= eps1 / px) then goto 55;
  45:   cnt := cnt * px;
        if (cnt > 1.0) then
        begin
          { rescale }
          temp := temp - 1.0;
          cnt := cnt * eps1;
        end; { if }
        ps := wh;
        if (temp = 0.0) then
          tot := tot + cnt;
        goto 40;
  55:   p := tot + xint;
    end; { else }
    if (int1 <> 0) then
      p := 1.0 - p;
    end; { else }
  end;

const
  eps = 1.0e-5;
  sig = 1.0e-6;
(*
  eps = 0.0001;
  sig = 10.e-5;
*)
  itmax = 200;
  smexe = -87.0;
var
  aa, afn, bb, c, dtemp, fcs, fn, fxl, p1, q0, qx, temp, xc, xl, xr, xrmxl,
      xt, zi, zz, aabb: double;
  ic, nc, ier: integer;
begin
  ier   := 0;
  xc    := 1.0;
  fcs   := 1.0;
  xrmxl := 1.0;
  xl := min(a, b);
  xr := max(a, b);
  if (xl > 1.0) and (10.0 * xl > xr) then
  begin
    ic := 0;
    xl := 0.0;
    xr := 1.0;
    fxl := -p;
    { bisection method: }
    repeat
      inc(ic);
      result := (xl + xr) * 0.5;
      mdbeta(result, a, b, p1, ier);
      if (ier = 0) then
      begin
        fcs := p1 - p;
        if (fcs * fxl <= 0.0) then
          xr := result
        else
        begin
          xl := result;
          fxl := fcs;
        end; { else }  
        xrmxl := xr - xl;
      end; { if }
    until (ic > itmax) or (ier <> 0) or ((xrmxl <= sig) and (abs(fcs) <= eps));
  end; { if }

  { If error returned from mdbeta then use Newton's method for skewed cases}
  if (p <= 0.5) then
  begin
    aa := a;
    bb := b;
    q0 := ln(p);
  end else
  begin
    aa := b;
    bb := a;
    q0 := ln(1.0 - p);
  end;
  aabb  := aa + bb;
  xt    := aa / (aabb);
  dtemp := gammaln(aabb) - gammaln(aa) - gammaln(bb);
  dtemp := dtemp - (aabb) * ln(aabb) + (aa - 0.5) * ln(aa) + (bb - 0.5) * ln(bb);
  dtemp := dtemp + 0.5 * ln(bb / aa) + aa * ln(1.0 + bb / aa) + bb
           * ln(1.0 + aa / bb);
  nc  :=  0;
  repeat
    inc(nc);
    temp := ln(15.0 + aabb);
    fn   := 0.7 * sqr(temp) + max(xt * (aabb) - aa, 0.0);
    temp := aa + fn + fn;
    afn  := floor(fn)  +  1.0;
    c    := 1.0 - (aabb) * xt / temp;
    zi   := 2.0 / (c + sqrt(c * c - 4.0 * fn * (fn - bb) * xt / (sqr(temp))));
    while afn >= 0.5 do
    begin
      afn := afn - 1.0;
      if afn >= 0.5 then
      begin
        temp := aa + afn + afn;
        zi := (temp - 2.0) * (temp - 1.0 - afn * (afn - bb) * xt * zi / temp);
        temp := aa + afn - 1.0;
        zi := 1.0 / (1.0 - temp * (temp + bb) * xt / zi);
      end;
    end; { while }
    zz := zi;
    temp := ln(xt);
    if (temp > smexe) then 
    begin
      qx := dtemp + aa * temp + bb * ln(1.0 - xt) + ln(zz);
      xc := (q0 - qx) * (1.0 - xt) * zz / aa;
      xc := max(xc,  - 0.99);
      temp := 0.5 / xt - 0.5;
      xc := min(xc, temp);
      xt := xt * (1.0 + xc);
    end; { if }
  until (temp <= smexe) or (abs(xc) < sig) or (nc > itmax);
  if (temp <= smexe) then
    xt := 0.0;
  if (p <= 0.5) then
    result := xt
   else
     result := 1.0 - xt;
end;

function Erf;
{
Translated from CDFLIB: Library of Fortran Routines for Cumulative
Distribution Functions, Inverses, and Other Parameters (June, 1993).
Barry W. Brown, James Lovato, Department of Biomathematics, Box 237
The University of Texas, M.D. Anderson Cancer Center, 1515 Holcombe Boulevard,
Houston, TX 77030
}
const
  c = 0.564189583547756;
  a: array[1..5] of double = (0.771058495001320e-04, -0.133733772997339e-02,
      0.323076579225834e-01, 0.479137145607681e-01, 0.128379167095513);
  b: array[1..3] of double = (0.301048631703895e-02, 0.538971687740286e-01,
      0.375795757275549);
  p: array[1..8] of double = (-1.36864857382717e-07, 5.64195517478974e-01,
      7.21175825088309, 4.31622272220567e+01, 1.52989285046940e+02,
      3.39320816734344e+02, 4.51918953711873e+02, 3.00459261020162e+02);
  q: array[1..8] of double = (1.0, 1.27827273196294e+01, 7.70001529352295e+01,
      2.77585444743988e+02, 6.38980264465631e+02, 9.31354094850610e+02,
      7.90950925327898e+02, 3.00459260956983e+02);
  r: array[1..5] of double = (2.10144126479064, 2.62370141675169e+01,
      2.13688200555087e+01, 4.65807828718470, 2.82094791773523e-01);
  s: array[1..4] of double = (9.41537750555460e+01, 1.87114811799590e+02,
      9.90191814623914e+01, 1.80124575948747e+01);
var
  ax, bot, t, top, x2: double;
begin
  ax := abs(x);
  if (ax <= 0.5) then
  begin
    t := sqr(x);
    top := ((((a[1] * t + a[2]) * t + a[3]) * t + a[4]) * t + a[5]) + 1.0;
    bot := ((b[1] * t + b[2]) * t + b[3]) * t + 1.0;
    Result := x * (top / bot);
  end
  else if (ax <= 4.0) then
  begin
    top := ((((((p[1] * ax + p[2]) * ax + p[3]) * ax + p[4]) * ax + p[5]) * ax
        + p[6]) * ax + p[7]) * ax + p[8];
    bot := ((((((q[1] * ax + q[2]) * ax + q[3]) * ax + q[4]) * ax + q[5]) * ax
        + q[6]) * ax + q[7]) * ax + q[8];
    Result := 0.5 + (0.5 - exp(-sqr(x)) * top / bot);
    if (x < 0.0) then
      Result := -Result;
  end
  else if (ax < 5.8) then
  begin
    x2 := sqr(x);
    t := 1.0 / x2;
    top := (((r[1] * t + r[2]) * t + r[3]) * t + r[4]) * t + r[5];
    bot := (((s[1] * t + s[2]) * t + s[3]) * t + s[4]) * t + 1.0;
    Result := (c - top / (x2 * bot)) / ax;
    Result := 0.5  +  (0.5 - exp(-x2) * Result);
    if (x < 0.0) then
      Result := -Result;
  end
  else if x >= 0.0 then
    Result := 1.0
  else
    Result := -1.0;
end;

end.
