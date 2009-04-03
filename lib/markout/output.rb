module Markout

  class Output

    attr_reader :document, :format, :formatter

    def initialize(path, options = {})
      @path      = path
      @options   = options
      @document  = Document.new(@path, :history => @options[:history])
      @format    = @options[:format]   || 'html'
      @formatter = pick_formatter.new( @document, :template => @options[:template] || 'default' )
      @output    = ''
    end

    def export(to_file=false)
      @output = @formatter.export
      write_file if to_file
      return @output
    end

    def output_path
      if @options[:output]
        File.join( File.expand_path( @options[:output] ), @formatter.filename )
      else
        @document.base_path.join(@formatter.filename)
      end
    end

    private

    def write_file
      File.open(output_path, 'w') { |f| f.write @output }
    end

    def pick_formatter
      unless Markout::const_defined?(@format.to_s.capitalize)
        begin
          require File.join( File.dirname(__FILE__), 'formatters', @format, @format  ) 
        rescue Exception => e
          raise LoadError, "Formatter '#{@format}' not found! (#{e.message})"
        end
      end
      Markout::const_get(@format.to_s.capitalize)
    end

  end

end
