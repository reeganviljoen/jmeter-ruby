$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'jmeter-ruby'

test do
  csv_data_set_config filename: 'postcodes.csv',
    variableNames: 'postcode'

  threads count: 1 do
    visit name: 'Home', url: 'https://flooded.io?query=${postcode}'
  end
end.run(path: '/usr/share/jmeter/bin/', gui: true)
