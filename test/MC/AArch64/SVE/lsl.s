// RUN: llvm-mc -triple=aarch64 -show-encoding -mattr=+sve < %s \
// RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
// RUN: not llvm-mc -triple=aarch64 -show-encoding < %s 2>&1 \
// RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump -d -mattr=+sve - | FileCheck %s --check-prefix=CHECK-INST
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

lsl     z0.b, z0.b, #0
// CHECK-INST: lsl     z0.b, z0.b, #0
// CHECK-ENCODING: [0x00,0x9c,0x28,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 9c 28 04 <unknown>

lsl     z31.b, z31.b, #7
// CHECK-INST: lsl     z31.b, z31.b, #7
// CHECK-ENCODING: [0xff,0x9f,0x2f,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: ff 9f 2f 04 <unknown>

lsl     z0.h, z0.h, #0
// CHECK-INST: lsl     z0.h, z0.h, #0
// CHECK-ENCODING: [0x00,0x9c,0x30,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 9c 30 04 <unknown>

lsl     z31.h, z31.h, #15
// CHECK-INST: lsl     z31.h, z31.h, #15
// CHECK-ENCODING: [0xff,0x9f,0x3f,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: ff 9f 3f 04 <unknown>

lsl     z0.s, z0.s, #0
// CHECK-INST: lsl     z0.s, z0.s, #0
// CHECK-ENCODING: [0x00,0x9c,0x60,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 9c 60 04 <unknown>

lsl     z31.s, z31.s, #31
// CHECK-INST: lsl     z31.s, z31.s, #31
// CHECK-ENCODING: [0xff,0x9f,0x7f,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: ff 9f 7f 04 <unknown>

lsl     z0.d, z0.d, #0
// CHECK-INST: lsl     z0.d, z0.d, #0
// CHECK-ENCODING: [0x00,0x9c,0xa0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 9c a0 04 <unknown>

lsl     z31.d, z31.d, #63
// CHECK-INST: lsl     z31.d, z31.d, #63
// CHECK-ENCODING: [0xff,0x9f,0xff,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: ff 9f ff 04 <unknown>
