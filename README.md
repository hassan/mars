# Mars

A quickie implementation of a "Mars Rover" exercise in Elixir
where the "rover" is a GenServer that responds to `locate` and `instruct`.

Does not understand boundaries yet!

```
> iex -S mix
Erlang/OTP 21 [erts-10.0.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe] [dtrace]

Compiling 1 file (.ex)
Interactive Elixir (1.7.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> {:ok, pid} = GenServer.start_link(Mars.Rover, %{x: 1, y: 2, dir: :north})
{:ok, #PID<0.146.0>}
iex(2)> GenServer.call(pid, :locate)
%{dir: :north, x: 1, y: 2}
iex(3)> GenServer.cast(pid, {:instruct, "M"})
:ok
iex(4)> GenServer.call(pid, :locate)
%{dir: :north, x: 1, y: 3}
iex(5)> GenServer.cast(pid, {:instruct, "MM"})
:ok
iex(6)> GenServer.call(pid, :locate)
%{dir: :north, x: 1, y: 5}
iex(7)> GenServer.cast(pid, {:instruct, "RM"})
:ok
iex(8)> GenServer.call(pid, :locate)
%{dir: :east, x: 2, y: 5}
iex(9)>
```
