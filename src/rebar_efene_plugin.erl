-module(rebar_efene_plugin).

-export([compile/2]).

compile(Config, File) ->
  rebar_log:log(warn, "Compile: [~p][~p]~n", [File, Config]).
