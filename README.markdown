## Overview

Rebar and Efene are both neat. This plugin lets you combine these two great
flavors, allowing rebar to compile efene source files.

## Installation

In the root of your project dir, edit or create a file named `rebar.config`
and add `rebar_efene_plugin` to the `plugins` section, creating it if
necessary:

    {plugins, [
        rebar_efene_plugin
    ]}.

Also add the GitHub url for the stable branch of `rebar_efene_plugin`, as
well as the url for Efene itself, to the `deps` section:

    {deps, [
        {efene, ".*",
          {git, "git://github.com/marianoguerra/efene.git", "master"}
        },
        {rebar_efene_plugin, ".*",
            {git, "git://github.com/DavidMikeSimon/rebar_efene_plugin.git", "stable"}
        }
    ]}.

Now, from your project dir, tell rebar to download your dependencies and compile
your app:

    $ rebar get-deps
    ==> myapp (get-deps)
    Pulling rebar_efene_plugin from {git,"git://github.com/DavidMikeSimon/rebar_efene_plugin.git", "stable"}
    Cloning into rebar_efene_plugin...
    Switched to a new branch 'stable'
    Branch stable set up to track remote branch stable from origin.
    ==> rebar_efene_plugin (get-deps)

    $ rebar compile
    ==> rebar_efene_plugin (compile)
    Compiled src/rebar_efene_plugin.erl
    ==> myapp (compile)
    Compiled src/myapp_foo.ifn
    Compiled src/myapp_bar.ifn
    Compiled src/myapp_baz.ifn

Notice that rebar now automatically notices and compiles Efene and Ifene
files in your `src` directory! Neat, huh?
