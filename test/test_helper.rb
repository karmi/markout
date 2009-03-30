require 'rubygems'
require 'test/unit'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'markout'

def fixture(name)
  File.read( File.join(File.dirname(__FILE__), 'fixtures', name.to_s) )
end

def fixture_file(name)
  File.join(File.dirname(__FILE__), 'fixtures', name.to_s)
end

class Test::Unit::TestCase
end
