# Smart Thermostat

Smart Thermostat written using Julia and QML

## Setup

### Make

Clone repository. Open directory `JuliaThermostat/` in terminal. If your machine has the `make` utility installed, simply execute:

```
make precompile
```

### Without Make

Clone repository. Open directory `JuliaThermostat/` in terminal. Execute the following steps:

1. Run `julia` to enter Julia terminal
2. Enter `]` to enter Pkg REPL
3. Run `activate .`
4. Run `instantiate`
5. Backspace to exit Pkg REPL
6. `Ctrl-D` or `exit()` to exit Julia terminal

## Running

From directory `JuliaThermostat/` execute `make`. If you don't have the `make` utility, execute:

```terminal
julia --project=@. main.jl
```
