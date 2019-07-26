cmake_minimum_required(VERSION 3.2)
project(Hello)

set(PROJECT_ROOT /root/shared/v8_app/app1/)

include_directories(
	${PROJECT_ROOT}/include
)

link_directories(
    ${PROJECT_ROOT}/lib
)
link_libraries(
    v8_monolith
    pthread
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES
${PROJECT_ROOT}/src/main.cpp)

set(EXECUTABLE_OUTPUT_PATH 
${PROJECT_ROOT}/out/obj)

add_executable(hello ${SOURCE_FILES})
