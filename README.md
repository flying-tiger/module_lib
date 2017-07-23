# modulefiles
A library of generic modulefiles for software I use

## Summary
Since I work in HPC, [Environment Modules](http://modules.sourceforge.net/) are
my preferred method for managing tools. I try to keep a clean base environment
and then each project explicitly adds the modules it needs using some kind of
setup script. This repository contains a set of basic modulefiles for tools that
I will install locally on just about every system I use.

## Requirements
* Environment Modules 3.2+
* Tcl 8.0+

## Useage
The provided module files assume that tools are locally installed in a directory
structure that mirrors the layout and naming of the modulefiles themselves. The
modulefiles project should be cloned into the top level of the directory
structure. Therefore, the layout should looks like this:

    $TOOLS_HOME/
       |
       |-- modulefiles/ # From github
       |     |-- LICENSE
       |     |-- README.md
       |     |-- anaconda3/
       |     |     |-- v1.0.0
       |     |     |-- v2.0.0
       |     |     |-- etc.
       |     |-- julia/
       |     |     |-- v0.1.0
       |     |     |-- v0.2.0
       |     |     |-- etc.
       |     |-- etc.
       |
       |-- anaconda3/
       |     |-- v1.0.0/
       |     |-- v2.0.0/
       |     |-- etc.
       |
       |-- julia/
       |     |-- v0.1.0
       |     |-- v0.2.0
       |     |-- etc.
       |
       |-- etc.

Once the directory structure is correct, simply add the modulefiles directory to
the module search path and tell Tcl where to find the supporting utilities (I 
recommend adding this to your .bashrc, .cshrc, etc.):

    >> module use --append $TOOL_HOME/modulefiles
    >> export TCLLIBPATH="$TOOL_HOME/__tcllib"

It is not required to have software installed for all the modulefiles provided.
If a tool directory is missing, an error message will be displayed when the user
attempts to load the module.
