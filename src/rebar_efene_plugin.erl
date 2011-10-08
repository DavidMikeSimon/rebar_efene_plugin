-module(rebar_efene_plugin).

-export([compile/2]).

compile(_Config, AppFile) ->
  rebar_log:log(info, "Converting efene source files near ~p~n", [AppFile]),
  DirName = filename:dirname(AppFile),
  {ok, Files} = file:list_dir(DirName),
  process_efene_files(DirName, Files).

process_efene_files(DirName, Files) ->
  Result = os:cmd(io_lib:format("ls ~s", [DirName])),
  rebar_log:log(info, "Converting ~p: ~p~n", [DirName, Result]).
