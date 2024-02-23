set -Eeuxo pipefail # https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

ghdl -r --workdir=HW/build adder_tb | tee ghdl_report.txt

echo ""
echo "################################"
echo "checking for errors"
echo "################################"

if grep "assertion error" ghdl_report.txt; then
    echo "at least one assertion failed"
    echo "################################"
    exit 1
else
    echo "everything's fine"
    echo "################################"
fi
