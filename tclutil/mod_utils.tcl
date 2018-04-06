namespace eval ::mod_utils {
    namespace export get_tool_path
    variable tool_root $::env(MODULE_LIB_SOFTWARE)
}

proc ::mod_utils::get_tool_path {mfile} {
    # Given the full path to a modulefile, return the full path to
    # the install directory for the associated tool.
    variable tool_name [lrange [file split $mfile] end-1 end]
    variable tool_path [file join $mod_utils::tool_root {*}$tool_name]
    if ![file isdirectory $tool_path] {
        puts stderr "Error: $tool_name not installed in \$MODULE_LIB_SOFTWARE:\n$mod_utils::tool_root"
        break
    }
    return $tool_path
}

package provide mod_utils 1.0
