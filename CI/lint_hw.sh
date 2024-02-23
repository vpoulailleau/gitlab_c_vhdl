set -Eeuxo pipefail # https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

find . -name "*.vhd" -o -name "*.vhdl" | xargs vsg --configuration vsg_config.yaml -f
