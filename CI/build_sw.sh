set -Eeuxo pipefail # https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

mkdir -p "SW/build"
gcc -c SW/sources/add.c -I SW/include -o SW/build/add.o
gcc -c SW/sources/main.c -I SW/include -o SW/build/main.o
gcc SW/build/add.o SW/build/main.o -o SW/build/program.exe
