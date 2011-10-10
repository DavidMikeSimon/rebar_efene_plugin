## Overview

Rebar and Efene are both neat. This plugin lets you combine these two great
flavors, allowing rebar to compile efene source files.

## Installation

In the root of your project dir, edit or create a file named `rebar.config`
and add `rebar_efene_plugin` to the `rebar_plugins` section, creating it if
necessary:

    {rebar_plugins, [
        rebar_efene_plugin
    ]}.

Also add the GitHub url for the stable branch of `rebar_efene_plugin` to
the `deps` section:

    {deps, [
        {rebar_efene_plugin, ".*",
            {git, "git://github.com/DavidMikeSimon/rebar_efene_plugin.git", "stable"}
        }
    ]}.

Now, from your project dir, tell rebar to download your dependencies and compile
your app:

    $ rebar get-deps
