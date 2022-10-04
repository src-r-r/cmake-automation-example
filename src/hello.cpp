#include "hello.hpp"
#include <exception>
#include <iterator>
#include <regex>
#include <stdexcept>

HelloWriter::HelloWriter(const std::string &greeting) {
  if (greeting.find("{}") == std::string::npos) {
    throw new std::invalid_argument(
        "Templating symbols `{}` not found in greeting: '" + greeting + "'");
  }
  this->mGreeting = greeting;
}

const std::string HelloWriter::greet(const std::string &name) {
  const std::regex rx("\\{\\}");
  return std::regex_replace(this->mGreeting, rx, name);
}