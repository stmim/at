import math

A, B, H, M = input().split(' ')
A = int(A)
B = int(B)
H = int(H)
M = int(M)

sa = H * 6
ax = A * math.cos(sa)
ay = A * math.sin(sa)

sb = M * 6
bx = B * math.cos(sb)
by = B * math.sin(sb)

s = (ax-bx)**2 + (ay - by)**2
s = math.sqrt(s)

print(s)