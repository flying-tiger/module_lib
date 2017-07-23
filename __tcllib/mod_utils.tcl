namespace eval ::mod_utils {
    namespace export get_tool_path
    variable util_root [file normalize [file dirname [info script]]]
    variable tool_root [file normalize $util_root/../../]
}

proc ::mod_utils::get_tool_path {mfile} {
    # Given the full path to a modulefile, return the full path to
    # the install directory for the associated tool.
    variable tool_name [lrange [file split $mfile] end-1 end]
    variable tool_path [file join $mod_utils::tool_root {*}$tool_name]
    if ![file isdirectory $tool_path] {
        puts stderr "Error: $tool_name is not installed in \$HOME/tools"
        break
    }
    return $tool_path
}

package provide mod_utils 1.0
