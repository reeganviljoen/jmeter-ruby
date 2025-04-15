module JmeterRuby
  module VERSION
    MAJOR = 3
    MINOR = 22
    PATCH = 0
    PRE = nil

    STRING = [MAJOR, MINOR, PATCH, PRE].compact.join(".")
  end
end

puts JmeterRuby::VERSION::STRING if __FILE__ == $PROGRAM_NAME
