require File.join(File.dirname(__FILE__), 'test_helper')

# Load all testfiles excluding self
(Dir['*_test.rb'] - [File.basename(__FILE__)]).each { |testcase| require testcase }

