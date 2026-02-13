# automatically enable catch2 to generate ctest targets

    find_package(GTest CONFIG REQUIRED)
    set(THREADS_PREFER_PTHREAD_FLAG ON)
    include(GoogleTest)
    add_executable(mytest mytest.cpp)
    target_link_libraries(mytest PRIVATE GTest::gtest GTest::gtest_main ${CMAKE_THREAD_LIBS_INIT})
    gtest_discover_tests(mytest)

