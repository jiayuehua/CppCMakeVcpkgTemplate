# automatically enable catch2 to generate ctest targets

    find_package(GTest CONFIG REQUIRED)
    include(GoogleTest)
    add_executable(mytest mytest.cpp)
    target_link_libraries(mytest PRIVATE GTest::gtest GTest::gtest_main)
    gtest_discover_tests(mytest)



