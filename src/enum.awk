# @file enum.awk
# Look-up a name or a value from C files with enumeration declarations.
#
# @author Jiang Yu-Kuan <yukuan.jiang@gmail.com>
# @date 2015/12/03 (initial version)
# @date 2015/12/06 (last revision)
# @version 2.0

BEGIN {
    if (cmd == "version") {
        print "Enum Lookup, enum v2.0"
        print "         Jiang Yu-Kuan <york_jiang@mars-semi.com.tw>"
        print "         2015/12/06"
        exit
    }
    if (cmd == "help") {
        print "Look-up a name or a value from C files with enumeration",
              "declarations."
        print ""
        print "Usage: enum -v key=value InputFiles"
        print "       enum -v cmd=help"
        print "       enum -v cmd=version"
        exit
    }

    FS = "[[:space:]]*=[[:space:]]*"
    RS = "[,\n][[:space:]]*"
}

/enum[[:space:]]*{/ {
    idx = 0     # reset the index of enumeration
}

/enum[[:space:]]*{/, /}/ {
    if ($0 ~ /enum[[:space:]]*{/)
        next
    if ($0 ~ /}/)
        next
    if ($0 !~ /^[[:alpha:]_]/)
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
    return (x ~ /^[[:space:]]*[[:digit:]]+[[:space:]]*$/) ||
           (x ~ /^[[:space:]]*0[xX][[:xdigit:]]+[[:space:]]*$/)
}


#-------------------------------------------------------------------------------

