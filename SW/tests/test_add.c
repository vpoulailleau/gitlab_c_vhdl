#include <criterion/criterion.h>
#include "add.h"

Test(add_suite, zero_and_zero) {
  cr_assert(add(0, 0) == 0);
}

Test(add_suite, zero_and_one) {
  cr_assert(add(0, 1) == 1);
}

Test(add_suite, two_and_four) {
  cr_assert(add(2, 4) == 6);
}

Test(add_suite, minus_two_and_four) {
  cr_assert(add(-2, 4) == 2);
}
