# @file enum.awk
# Look-up a name (enumerator) or a value (an integer) of C enumerations.
#
# @author Jiang Yu-Kuan <yukuan.jiang@gmail.com>
# @date 2015/12/03 (initial version)
# @date 2016/01/13 (last revision)
# @version 2.0

function version() {
    print "Enum Lookup, enum v2.0"
    print "         Jiang Yu-Kuan <yukuan.jiang@gmail.com>"
    print "         2015/12/20"
}

function help() {
    print "Look-up a name (enumerator) or a value (an integer) of C enumerations."
    print ""
    print "Usage: enum.exe -v key=value InputFiles"
    print "       enum.exe -v cmd=help"
    print "       enum.exe -v cmd=version"
}


BEGIN {
    if (cmd == "version") {
        version()
        exit
    }
    if ((cmd == "help") || (key == "")) {
        help()
        exit
    }

    FS = "[[:space:]]*=[[:space:]]*"
    RS = "[,\n][[:space:]]*"
}

/enum[[:space:]]*{/ {
    idx = 0     # reset the index of enumeration
}

/enum[[:space:]]*{/, /}/ {
    if (/enum[[:space:]]*{/)
        next
    if (/}/)
        next
    if (!/^[[:alpha:]_]/)
        next

    if (isnum($2)) {
        idx = $2
        $2 = ""
    }

    if ($2 == "") {
        tbl[$1] = idx
        tbl[idx] = tbl[idx] $1 "\n"
        ++idx
    }
    else {
        tbl[$1] = tbl[$2]
        tbl[tbl[$2]] = tbl[tbl[$2]] $1 "\n"
    }
}

END {
    printf tbl[key]
}


#-------------------------------------------------------------------------------
# Help Functions
#-------------------------------------------------------------------------------

function isnum(x) {
    return (x ~ /^[[:digit:]]+$/) ||
           (x ~ /^0[xX][[:xdigit:]]+$/)
}


#-------------------------------------------------------------------------------

