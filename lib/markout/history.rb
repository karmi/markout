require 'grit'

module Markout

  class History
    attr_reader :repo, :revisions
    def initialize(document, options={})
      @document = document
      @options  = options
      load_repository
      load_revisions
      # puts @revisions.first.inspect
    end

    private
    def git_dir
      @options[:git_dir] || @document.base_path.join('.git')
    end
    def load_repository
      # TODO : raise when no Git repo available
      @repo = Grit::Repo.new(git_dir, :is_bare => !git_dir.nil?)
    end
    def load_revisions
      @repo ||= load_repository
      commits = @repo.log 'master', @document.filename
      @revisions = commits.collect { |c| Markout::Revision.new(c) }
      # puts @revisions
    end
  end

end
