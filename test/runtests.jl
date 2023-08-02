using StructuredQR
using Test
using BenchmarkTools, GenericLinearAlgebra
using LinearAlgebra

## Tests if the functions work properly ##
include("TestDenseQR.jl") #Successful tests
include("TestBlocDiagQR.jl") #Successful tests
include("TestHCatQR.jl") #Successful tests

## Benchmarks to show the memory allocations and the elapsed time ##
include("BenchmarkQRDense.jl")
include("BenchmarkQops.jl")
include("BenchmarkQRBlocDiag.jl")
include("BenchmarkQRHcat.jl")

"NB : pour le moment, qmul! ne fonctionne pas pour des matrices carrées, à revoir"