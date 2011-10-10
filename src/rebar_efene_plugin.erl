%% -*- tab-width: 4;erlang-indent-level: 4;indent-tabs-mode: nil -*-
%% ex: ts=4 sw=4 et
%% -------------------------------------------------------------------
%%
%% Rebar Efene Plugin is based upon rebar_lfe_compiler.erl from the 
%% Rebar project:
%%
%% Copyright (c) 2009 Dave Smith (dizzyd@dizzyd.com),
%%                    Tim Dysinger (tim@dysinger.net)
%%
%% Permission is hereby granted, free of charge, to any person obtaining a copy
%% of this software and associated documentation files (the "Software"), to deal
%% in the Software without restriction, including without limitation the rights
%% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%% copies of the Software, and to permit persons to whom the Software is
%% furnished to do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in
%% all copies or substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
%% THE SOFTWARE.
%% -------------------------------------------------------------------

-module(rebar_efene_plugin).

-export([compile/2]).

%% ===================================================================
%% Public API
%% ===================================================================

compile(Config, _AppFile) ->
    EfeneFirstFiles = rebar_config:get_list(Config, efene_first_files, []),
    IfeneFirstFiles = rebar_config:get_list(Config, ifene_first_files, []),
    rebar_base_compiler:run(Config, EfeneFirstFiles, "src", ".fn", "ebin", ".beam",
                            fun compile_efene/3),
    rebar_base_compiler:run(Config, IfeneFirstFiles, "src", ".ifn", "ebin", ".beam",
                            fun compile_efene/3).


%% ===================================================================
%% Internal functions
%% ===================================================================

compile_efene(Source, _Target, _Config) ->
    case code:which(fn) of
        non_existing ->
            io:format(
              "~n===============================================~n" ++
              " You need to install Efene to compile Efene source.~n" ++
              " Download it from here:~n" ++
              "   http://www.marianoguerra.com.ar/efene/#download~n" ++
              " and build it, and finally make sure to install it~n" ++
              " into your erlang library dir.~n" ++
              "===============================================~n~n", []),
            throw({error, failed});
        _ ->
          fn:compile(Source, "ebin")
    end.
