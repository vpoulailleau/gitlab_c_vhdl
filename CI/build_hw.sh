set -Eeuxo pipefail # https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

mkdir -p "HW/build"
ghdl -a --workdir=HW/build HW/sources/* HW/tests/adder_tb.vhdl
ghdl -e --workdir=HW/build adder_tb
