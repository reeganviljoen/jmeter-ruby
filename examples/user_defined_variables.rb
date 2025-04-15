$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'jmeter-ruby'

test do
  # user defined with multiple values
  variables [
    { name: 'email', value: 'support@flood.io' },
    { name: 'password', value: 'password' }
  ]
end.run(path: '/usr/share/jmeter/bin/', gui: true)
