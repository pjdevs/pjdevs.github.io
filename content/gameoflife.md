+++
title = "Game of Life optimization"
date = "2023-01-01"
description = "A CPU and GPU optimization inside EasyPAP made in C with OpenMP and OpenCL in parallel computing course at ENSEIRB-MATMECA"

[extra]
index = 3
img = "gol.png"
skills = ["C", "OpenMP", "OpenCL"]
+++

Different optimizations were implemented in this project. The goal was to use the parallel power of the
new GPU and CPU architectures to get as much as possible speedup on the game of life. We implemented :

- OpenMP multithreaded tiled versions of the game of life with different size of tiles and different thread count (see report below).
We aslo explored diverse scheduling policy.

- A GPU powered version with an OpenCL kernel.

- A GPU and CPU lazy tiled version to compute only changing tiles.

Full written report and analysis <a href="/documents/gpu_report.pdf" target="_blank">here</a>