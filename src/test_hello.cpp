#include "hello.hpp"
#include <catch2/catch_test_macros.hpp>

TEST_CASE("Hello Message", "[hello_message]") {
  const std::string badGreeting = "This is a greeting for...", name = "Sue",
                    goodGreeting =
                        "Why, it's a lovely day, {}, and nice to meet you!",
                    expected =
                        "Why, it's a lovely day, Sue, and nice to meet you!";

  SECTION("Raises an exception if no format params are supplied") {
    REQUIRE_THROWS(HelloWriter(badGreeting));
  }

  SECTION("If we include the format params we can greet normally") {
    HelloWriter goodWriter(goodGreeting);
    REQUIRE(goodWriter.greet(name) == expected);
  }
}