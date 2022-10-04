#include <string>
class HelloWriter {
private:
  std::string mGreeting;

public:
  HelloWriter(const std::string &);

  const std::string greet(const std::string &);
};