layout=$1
# example: slate-layout.kdl
if [ -z "$layout" ]; then
    echo "Usage: run_zellij.sh <layout.kdl>"
    exit 1
fi
zellij --layout ${layout}
