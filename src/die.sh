# Trimmed down version of die without stack trace
#
# Usage: die "Error message"
die() {
    # Print our error message
    printf "Error: %b\n" "$*"

    exit 1
}
