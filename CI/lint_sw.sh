set -Eeuxo pipefail # https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

clang-tidy \
  --checks=bugprone-*,cert-*,clang-analyzer-*,performance-*,portability-*,readability-*,-readability-magic-numbers \
  --header-filter=.* \
  SW/sources/* SW/tests/* \
  -- -I SW/include # compiler options
cppcheck -v --enable=all -I SW/include --suppress=missingIncludeSystem SW/
