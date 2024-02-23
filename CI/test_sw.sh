set -Eeuxo pipefail # https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

mkdir -p "SW/build"
gcc -c SW/sources/add.c -I SW/include -o SW/build/add.o
gcc -c SW/tests/test_add.c -I SW/include -o SW/build/test_add.o
gcc SW/build/add.o SW/build/test_add.o -lcriterion -o SW/build/tests.exe
./SW/build/tests.exe
