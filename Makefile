all: run

precompile:
	julia -e "using Pkg; Pkg.activate(\".\"); Pkg.instantiate()"

run:
	julia --project=@. main.jl
