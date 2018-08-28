# Mars

A quickie implementation of a "Mars Rover" exercise in Elixir
where the "rover" is a GenServer that responds to `locate` and `instruct`.

Does not understand boundaries yet!

```
$ iex -S mix
Erlang/OTP 21 [erts-10.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Mars.Commander.launch()
{:ok, #PID<0.137.0>}
iex(2)> Mars.Commander.locate(Rover)
%{dir: :north, x: 3, y: 3}
iex(3)> Mars.Commander.move(Rover)
:ok
iex(4)> Mars.Commander.locate(Rover)
%{dir: :north, x: 3, y: 4}
iex(5)> Mars.Commander.turn(Rover, "L")
:ok
iex(6)> Mars.Commander.locate(Rover)
%{dir: :west, x: 3, y: 4}
iex(7)> Mars.Commander.move(Rover)
:ok
iex(8)> Mars.Commander.locate(Rover)
%{dir: :west, x: 2, y: 4}
iex(9)>
```
