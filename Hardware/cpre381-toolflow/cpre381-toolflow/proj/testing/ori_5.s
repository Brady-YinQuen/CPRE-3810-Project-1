# using the ori function on each bit twice should act the same as oring them once
# This case covers that oring a 1 to a bit will always output a 1 no matter how many times
# and that given a 1 and a zero an or will always output a 1
ori $s1, $s0, 0x00000001
ori $s1, $s1, 0x00000001
ori $s1, $s1, 0x00000002
ori $s1, $s1, 0x00000002
ori $s1, $s1, 0x00000004
ori $s1, $s1, 0x00000004
ori $s1, $s1, 0x00000008
ori $s1, $s1, 0x00000008

ori $s1, $s1, 0x00000010
ori $s1, $s1, 0x00000010
ori $s1, $s1, 0x00000020
ori $s1, $s1, 0x00000020
ori $s1, $s1, 0x00000040
ori $s1, $s1, 0x00000040
ori $s1, $s1, 0x00000080
ori $s1, $s1, 0x00000080

ori $s1, $s1, 0x00000100
ori $s1, $s1, 0x00000100
ori $s1, $s1, 0x00000200
ori $s1, $s1, 0x00000200
ori $s1, $s1, 0x00000400
ori $s1, $s1, 0x00000400
ori $s1, $s1, 0x00000800
ori $s1, $s1, 0x00000800

ori $s1, $s1, 0x00001000
ori $s1, $s1, 0x00001000
ori $s1, $s1, 0x00002000
ori $s1, $s1, 0x00002000
ori $s1, $s1, 0x00004000
ori $s1, $s1, 0x00004000
ori $s1, $s1, 0x00008000
ori $s1, $s1, 0x00008000

ori $s1, $s1, 0x00010000
ori $s1, $s1, 0x00010000
ori $s1, $s1, 0x00020000
ori $s1, $s1, 0x00020000
ori $s1, $s1, 0x00040000
ori $s1, $s1, 0x00040000
ori $s1, $s1, 0x00080000
ori $s1, $s1, 0x00080000

ori $s1, $s1, 0x00100000
ori $s1, $s1, 0x00100000
ori $s1, $s1, 0x00200000
ori $s1, $s1, 0x00200000
ori $s1, $s1, 0x00400000
ori $s1, $s1, 0x00400000
ori $s1, $s1, 0x00800000
ori $s1, $s1, 0x00800000

ori $s1, $s1, 0x01000000
ori $s1, $s1, 0x01000000
ori $s1, $s1, 0x02000000
ori $s1, $s1, 0x02000000
ori $s1, $s1, 0x04000000
ori $s1, $s1, 0x04000000
ori $s1, $s1, 0x08000000
ori $s1, $s1, 0x08000000

ori $s1, $s1, 0x10000000
ori $s1, $s1, 0x10000000
ori $s1, $s1, 0x20000000
ori $s1, $s1, 0x20000000
ori $s1, $s1, 0x40000000
ori $s1, $s1, 0x40000000
ori $s1, $s1, 0x80000000
ori $s1, $s1, 0x80000000
halt

