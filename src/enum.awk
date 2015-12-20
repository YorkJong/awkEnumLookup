# @file enum.awk
# Look-up a name or a value from C files with enumeration declarations.
#
# @author Jiang Yu-Kuan <yukuan.jiang@gmail.com>
# @date 2015/12/03 (initial version)
# @date 2015/12/20 (last revision)
# @version 2.0

function version() {
    print "Enum Lookup, enum v2.0"
    print "         Jiang Yu-Kuan <yukuan.jiang@gmail.com>"
    print "         2015/12/20"
}

function help() {
    print "Look-up a name or a value from C files with enumeration",
          "declarations."
    print ""
    print "Usage: enum -v key=value InputFiles"
    print "       enum -v cmd=help"
    print "       enum -v cmd=version"
}


BEGIN {
    if ((key == "") && (cmd == ""))
        cmd = "help"

    if (cmd == "version") {
        version()
        exit
    }
    if (cmd == "help") {
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

