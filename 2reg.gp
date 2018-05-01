\\ ---------------------------------------------------------\\
\\ Crude complexity of 2-regular syndrome decoding
\\ Author: Christiane Peters
\\ Date: 01-May-2018
\\ ---------------------------------------------------------\\
\\ Paper: "Faster 2-regular information-set decoding
\\ by Daniel J. Bernstein and Tanja Lange and Christiane Peters
\\ and Peter Schwabe.
\\ https://eprint.iacr.org/2011/120 
\\ ---------------------------------------------------------\\
\\ This script uses the Pari/GP library which is available
\\ online at http://pari.math.u-bordeaux.fr/gp.html
\\ Local install e.g., with 'sudo apt-get install pari-gp'
\\ and function call 'gp' on the command line
\\ For installation on other Operating Systems check out the 
\\ Pari/GP website
\\ ---------------------------------------------------------\\
\\ Faster 2-regular syndrome decoding cost:
\\ First compute expected number of codewords:
\\ delta=N^2/2^r*f^(2*x)*(1+binomial(f,2))^(w0-2.*x) and r-l=f*w0
\\ Then the cost of the algorithm equals
\\ delta*                 \\ expected number of codewords
\\ (1/2*(n-k)^2*(n+k)+    \\ linear algebra
\\  2*N*l+                \\ additions of elements of L and R assuming reuse
\\ (N^2/2^l)*2*x*(r-l))   \\ additions of partial collisions
\\ ---------------------------------------------------------\\
\pb
\\ FSB-48 was designed for >=2^24 collision resistance with
\\ parameters r=192, B=2^14, w = 24. 
\\ Our attack cost is computed below with parameters
\\ w0=24, x=3, and l=48.
r=192
b=14 \\ B=2^b
w=24
w0=24
x=3
N=binomial(w0/2,x)*(2^b-r/w0)^x; 
l=48
delta=1.*N^2/2^r*((r-l)/w0)^(2*x)*(1+binomial((r-l)/w0,2))^(w0-2*x);
n=2^b*w; k=n-r;\
cost=log(delta*(1/2*(n-k)^2*(n+k)+2*N*l+(N^2/2^l)*2*x*(r-l)))/log(2);
print("cost FSB48=2^",cost)
print("N=2^",log(N)/log(2.))
\\ ---------------------------------------------------------\\
\\ FSB-160 was designed for >=2^80 collision resistance with
\\ parameters r=640, B=2^14, w=80.
\\ Our attack cost is computed below with parameters
\\ w0=76, x=11, and l=184.
r=640
b=14 \\ B=2^b
w=80
w0=76
x=11
N=binomial(w0/2,x)*(2^b-r/w0)^x;
l=184
delta=N^2/2^r*((r-l)/w0)^(2*x)*(1+binomial((r-l)/w0,2))^(w0-2.*x);
n=2^b*w; k=n-r;
cost=log(delta*(1/2*(n-k)^2*(n+k)+2*N*l+(N^2/2^l)*2*x*(r-l)))/log(2);
print("cost FSB160=2^",cost)
print("N=2^",log(N)/log(2.))
\\ ---------------------------------------------------------\\
\\ FSB-256 was designed for >=2^128 collision resistance with
\\ r=1024, B=2^14, and w=128.
\\ Our attack cost is computed below with parameters
\\ w_0=122, x=17, and l=292.
r=1024
b=14 \\ B=2^b
w=128
w0=122
x=17
N=binomial(w0/2,x)*(2^b-r/w0)^x; 
l=292
cost=log(delta*(1/2*(n-k)^2*(n+k)+2*N*l+(N^2/2^l)*2*x*(r-l)))/log(2);
print("cost FSB256=2^",cost)
print("N=2^",log(N)/log(2.))
\\ ---------------------------------------------------------\\
\\ RFSB-509 was designed for >=2^128 collision resistance with
\\ r=509, B=2^8, and w=112.
\\ Our attack cost is computed below with parameters
\\ w_0=94, x=12, and l=133.
r=509
b=8 \\ B=2^b
w=112
w0=94
x=12
N=binomial(w0/2,x)*(2^b-r/w0)^x; 
l=133
cost=log(delta*(1/2*(n-k)^2*(n+k)+2*N*l+(N^2/2^l)*2*x*(r-l)))/log(2);
print("cost RFSB509=2^",cost)
print("N=2^",log(N)/log(2.))
\\ ---------------------------------------------------------\\
\\  cost FSB48=2^56.427607011637942049270203709502220484
\\           N=2^49.779245874594891485844967645923417074
\\ cost FSB160=2^198.83309112716405498594179285576012770
\\           N=2^184.15621716644444911739380711875987120
\\ cost FSB256=2^298.46598193102811576863041642565646803
\\           N=2^286.91889109757391333997845812498284177
\\cost RFSB509=2^143.92820556298724602949722634935014027
\\           N=2^131.23463298352136947472033443141437132

