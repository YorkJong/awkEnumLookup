# @file enum.awk
# This script is used to look-up a value from a generated C enumration header
# file.
#
# @author Jiang Yu-Kuan <yukuan.jiang@gmail.com>
# @date 2015/12/03 (initial version)
# @date 2015/12/06 (last revision)
# @version 1.0

function isnum(x) {
    return (x ~ /^[ \t]*[0-9]+[ \t]*$/) ||
           (x ~ /^[ \t]*0[xX][0-9a-fA-F]+[ \t]*$/)
}

BEGIN {
    if (cmd == "version") {
        print "Enum Lookup, enum v1.0"
        print "         Jiang Yu-Kuan <york_jiang@mars-semi.com.tw>"
        print "         2015/12/05"
        exit
    }
    if (cmd == "help") {
        print "Look-up a value from a generated C enumeration header file"
        print ""
        print "Usage: enum -v key=value InputFiles"
        print "       enum -v cmd=help"
        print "       enum -v cmd=version"
        exit
    }

    FS = "[ \t]+|[ \t]*=[ \t]*"
    RS = ",\n|\n"
}

/enum[ \t]*{/ {
    idx = 0     # reset the index of enumeration
}

/enum[ \t]*{/, /}/ {
    if ($0 ~ /enum[ \t]*{/)
        next
    if ($0 ~ /}/)
        next
    if ($0 !~ /^[ \t]+\w/)
        next

    if (isnum($3)) {
        idx = $3
        $3 = ""
    }

    if ($3 == "") {
        tbl[$2] = idx
        tbl[idx] = tbl[idx] $2 "\n"
        ++idx
    }
    else {
        tbl[$2] = tbl[$3]
        tbl[tbl[$3]] = tbl[tbl[$3]] $2 "\n"
    }
}

END {
    printf tbl[key]
}
