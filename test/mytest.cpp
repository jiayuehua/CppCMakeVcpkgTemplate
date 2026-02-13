#include <gtest/gtest.h>
int f(int n) { return n; }


TEST(FactorialTest, Negative) {
  // This test is named "Negative", and belongs to the "FactorialTest"
  // test case.
  EXPECT_EQ(1, 1);
  EXPECT_EQ(1, f(1));
  EXPECT_GT(f(10), 0);
}