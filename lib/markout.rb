$LOAD_PATH << File.join( File.dirname(__FILE__), 'markout' )

%w{output document formatter}.each { |lib| require lib }

module Markout

  class FileNotFound < Exception; end

end
