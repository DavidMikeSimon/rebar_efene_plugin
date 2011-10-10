-module(rebar_efene_compiler).

-export([compile/2]).

-include("rebar.hrl").

%% ===================================================================
%% Public API
%% ===================================================================

compile(Config, _AppFile) ->
    EfeneFirstFiles = rebar_config:get_list(Config, efene_first_files, []),
    IfeneFirstFiles = rebar_config:get_list(Config, ifene_first_files, []),
    rebar_base_compiler:run(Config, EfeneFirstFiles, "src", ".fn", "ebin", ".beam",
                            fun compile_efene/3).
    rebar_base_compiler:run(Config, IfeneFirstFiles, "src", ".ifn", "ebin", ".beam",
                            fun compile_efene/3).


%% ===================================================================
%% Internal functions
%% ===================================================================

compile_efene(Source, _Target, Config) ->
    case code:which(fn) of
        non_existing ->
            ?CONSOLE("~n===============================================~n" ++
                     " You need to install Efene to compile Efene source.~n" ++
                     "   Download it from here:~n" ++
                     "   http://www.marianoguerra.com.ar/efene/#download~n" ++
                     "   then build it, and finally make sure to~n" ++
                     "   install it into your erlang library dir~n" ++
                     "===============================================~n~n", []),
            ?FAIL;
        _ ->
          fn:compile(Source, "ebin")
    end.
