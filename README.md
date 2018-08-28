# Mars

A quickie implementation of a "Mars Rover" exercise in Elixir
where the "rover" is a GenServer that responds to `locate` and `instruct`.

Does not understand boundaries yet!

```
$ iex -S mix
Erlang/OTP 21 [erts-10.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Interactive Elixir (1.7.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> landing_zone = %{dir: :north, x: 1, y: 2}
%{dir: :north, x: 1, y: 2}
iex(2)> children = [%{id: Rover, start: {Mars.Rover, :start_link, [landing_zone]}}]
[%{id: Rover, start: {Mars.Rover, :start_link, [%{dir: :north, x: 1, y: 2}]}}]
iex(3)> {:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)
{:ok, #PID<0.139.0>}
iex(4)> Mars.Commander.locate(Rover)
%{dir: :north, x: 1, y: 2}
iex(5)> Mars.Commander.move(Rover)
:ok
iex(6)> Mars.Commander.locate(Rover)
%{dir: :north, x: 1, y: 3}
iex(7)> Mars.Commander.turn(Rover, "L")
:ok
iex(8)> Mars.Commander.locate(Rover)
%{dir: :west, x: 1, y: 3}
iex(9)>
```
