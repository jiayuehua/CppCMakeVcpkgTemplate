# automatically enable catch2 to generate ctest targets
    
    find_package(GTest CONFIG REQUIRED)
    find_package(Threads REQUIRED)
    include(GoogleTest)
    add_executable(mytest mytest.cpp)
    target_link_libraries(mytest PRIVATE GTest::gtest GTest::gtest_main Threads::Threads)
    gtest_discover_tests(mytest)
