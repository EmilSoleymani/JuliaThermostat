all: run

precompile:
	julia -e "using Pkg; Pkg.activate(\".\"); Pkg.precompile()"

run:
	julia --project=@. main.jl