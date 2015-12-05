# @file enum.awk
# This script is used to look-up a value from a generated C enumration header
# file.
#
# @author Jiang Yu-Kuan <yukuan.jiang@gmail.com>
# @date 2015/12/03 (initial version)
# @date 2015/12/06 (last revision)
# @version 1.0

BEGIN {
    if (cmd == "version") {
        print "Enum Lookup, enum v1.0"
        print "         Jiang Yu-Kuan <york_jiang@mars-semi.com.tw>"
        print "         2015/12/05"
        exit
    }
    if (cmd == "help") {
        print "Look-up a value from a generated C enumeration header file"
        print
        print "Usage: enum -v key=value InputFiles"
        print "       enum -v cmd=help"
        print "       enum -v cmd=version"
        exit
    }

    FS = " +| *= *"
    RS = ",\n|\n"
}

FNR == 1 {
    i = 0
}

/^    \w/ {
    if ($3 == "") {
        tbl[$2] = i
        tbl[i] = tbl[i] $2 "\n"
        ++i
    }
    else {
        tbl[$2] = tbl[$3]
        tbl[tbl[$3]] = tbl[tbl[$3]] $2 "\n"
    }
}

END {
    printf tbl[key]
}
