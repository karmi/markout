$LOAD_PATH << File.join( File.dirname(__FILE__), 'markout' )

%w{output document formatter history revision}.each { |lib| require lib }

module Markout

  class FileNotFound     < StandardError; end
  class FileNotSupported < StandardError; end

end
