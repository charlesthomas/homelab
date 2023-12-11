#!/usr/bin/env python3

import random

out = []

for _ in range(16):
    out.append(random.randrange(0,255))

print(f"network_key:", out)
