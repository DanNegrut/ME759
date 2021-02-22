
| &nbsp; | &nbsp; | &nbsp; | &nbsp; | &nbsp; | &nbsp; | &nbsp; | &nbsp; | &nbsp; | &nbsp; | &nbsp; | &nbsp; | &nbsp; |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| [A](#A) | [B](#B) | [C](#C) | [D](#D) | [E](#E) | [F](#F) | [G](#G) | [H](#H) | [I](#I) | [J](#J) | [K](#K) | [L](#L) | [M](#M) |
| [N](#N) | [O](#O) | [P](#P) | [Q](#Q) | [R](#R) | [S](#S) | [T](#T) | [U](#U) | [V](#V) | [W](#W) | [X](#X) | [Y](#Y) | [Z](#Z) |

---
## C

#### $ (_cache abbr_.)
The dollar sign character is sometimes used as an abbreviation for ["cache"](#cache). This originates from the similarity in English pronunciation between "cache" and "cash" (that is, money or currency).


#### Compiler
A tool which converts human-readable source code into a representation closer to [machine code](#machine-code).

#### CUDA Core
Another name for a [Streaming Processor](#streaming-processor).


---
## D

#### D$ (_cache_)
Abbreviation for **D**ata [**Cache**](#cache). _See also [$](#cache-abbr)_.


---
## G

#### GPGPU
Acronym. _See [**G**eneral-**P**urpose **GPU** Computing](general-purpose-gpu-computing)_.

#### General-Purpose GPU Computing
The practice of using GPUs for computing workloads other than graphics. Typically, this is used to accelerate certain [SIMD](#simd)-heavy tasks which were traditionally performed on CPUs.


---
## H

#### HBM
Acronym. _See [**H**igh **B**andwidth **M**emory](#high-bandwidth-memory)_.

#### HBM2
Acronym. _See [**H**igh **B**andwidth **M**emory](#high-bandwidth-memory)_.

#### High Bandwidth Memory
A type of high-speed [DRAM](#dram) which uses 3D-stacked memory dies to achieve higher density and transfer rates than conventional memory. Bus width is as high as 1024 bits per stack (compared to 32 bits per chip in conventional DDR memory). The HBM specification has been extended to include HBM2 and HBM2E with each providing higher bandwidth than the previous generation.

#### High Performance Computing
A computing discipline which relies on the combination of computing resources to achieve performance greater than that of a conventional computer. It may also refer to the practices leveraged to achieve such performance. _Compare_ [_HTC_](#htc).

#### HPC
Acronym. _See_ [_**H**igh **P**erformance **C**omputing_](#high-performance-computing).


---
## I

#### I$ (_cache_)
Abbreviation for **I**nstruction [**Cache**](#cache). _See also [$](#cache-abbr)_.

#### Instruction
The binary representation of a single action which can be completed by a processor. _See also_ [_CISC_](#cisc), [_RISC_](#risc).


---
## M

#### Machine Code
The binary representation of a computer's [instructions](#instruction) which can be understood by a processor.


---
## S

#### SIMD
Acronym. _See [**S**ingle **I**nstruction, **M**ultiple **D**ata](#single-instruction-multiple-data)_.

#### SIMT
Acronym. _See [**S**ingle **I**nstruction, **M**ultiple **T**hreads](#single-instruction-multiple-threads)_.

#### Single Instruction, Multiple Data
An execution model in which a single [instruction](#instruction) operates on multiple lanes of incoming data. _Related to [Vectorization](#vectorization) and [SIMT](#simt)_. _See also [SISD](#sisd) and [MPMD](#mpmd)_.

#### Single Instruction, Multiple Threads
A variant of the [SIMD](#simd) execution model in which multiple threads execute the same instruction in lockstep. Compare with [vectorization](#vectorization) where a single instruction executes on multiple data streams within a single thread. Often used in [GPGPU](#gpgpu) computing.

#### SM
Acronym. _See [**S**treaming **M**ultiprocessor](#streaming-multiprocessor)_.

#### SP
Acronym. _See [**S**treaming **P**rocessor](#streaming-processor)_.

#### Streaming Multiprocessor
Part of a CUDA-capable GPU which is made up of some number of [Streaming Processors](#streaming-processor). [Warps](#warp) are scheduled to the SM; the warp's [instruction](#instruction) stream is executed simultaneously on each SP.

#### Streaming Processor
Part of a CUDA-capable GPU. Each SP executes a single thread in CUDA's [SIMT](#simt) model.

#### Supercomputing
The process of using a [supercomputer](#supercomputer) to meet computing goals. _Related to_ [_HPC_](#HPC) _and_ [_HTC_](#HTC).

#### Supercomputer
A collection of individual computing resources which are connected such that they can behave as a single computer.

