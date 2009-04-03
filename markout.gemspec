# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{markout}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Karel Minarik"]
  s.date = %q{2009-04-03}
  s.default_executable = %q{markout}
  s.email = %q{karmi@karmi.cz}
  s.executables = ["markout"]
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["README.rdoc", "VERSION.yml", "bin/markout", "lib/markout", "lib/markout/document.rb", "lib/markout/formatter.rb", "lib/markout/formatters", "lib/markout/formatters/html", "lib/markout/formatters/html/html.rb", "lib/markout/formatters/html/templates", "lib/markout/formatters/html/templates/common", "lib/markout/formatters/html/templates/common/code.css", "lib/markout/formatters/html/templates/common/code_highlighter.js", "lib/markout/formatters/html/templates/common/syntax_diff.js", "lib/markout/formatters/html/templates/default", "lib/markout/formatters/html/templates/default/content.rhtml", "lib/markout/formatters/html/templates/default/print.css", "lib/markout/formatters/html/templates/default/screen.css", "lib/markout/formatters/pdf", "lib/markout/formatters/pdf/pdf.rb", "lib/markout/history.rb", "lib/markout/output.rb", "lib/markout/revision.rb", "lib/markout.rb", "test/fixtures", "test/fixtures/empty.txt", "test/fixtures/empty_repository", "test/fixtures/empty_repository__dot__git", "test/fixtures/empty_repository__dot__git/COMMIT_EDITMSG", "test/fixtures/empty_repository__dot__git/config", "test/fixtures/empty_repository__dot__git/description", "test/fixtures/empty_repository__dot__git/HEAD", "test/fixtures/empty_repository__dot__git/hooks", "test/fixtures/empty_repository__dot__git/hooks/applypatch-msg.sample", "test/fixtures/empty_repository__dot__git/hooks/commit-msg.sample", "test/fixtures/empty_repository__dot__git/hooks/post-commit.sample", "test/fixtures/empty_repository__dot__git/hooks/post-receive.sample", "test/fixtures/empty_repository__dot__git/hooks/post-update.sample", "test/fixtures/empty_repository__dot__git/hooks/pre-applypatch.sample", "test/fixtures/empty_repository__dot__git/hooks/pre-commit.sample", "test/fixtures/empty_repository__dot__git/hooks/pre-rebase.sample", "test/fixtures/empty_repository__dot__git/hooks/prepare-commit-msg.sample", "test/fixtures/empty_repository__dot__git/hooks/update.sample", "test/fixtures/empty_repository__dot__git/index", "test/fixtures/empty_repository__dot__git/info", "test/fixtures/empty_repository__dot__git/info/exclude", "test/fixtures/empty_repository__dot__git/logs", "test/fixtures/empty_repository__dot__git/logs/HEAD", "test/fixtures/empty_repository__dot__git/logs/refs", "test/fixtures/empty_repository__dot__git/logs/refs/heads", "test/fixtures/empty_repository__dot__git/logs/refs/heads/master", "test/fixtures/empty_repository__dot__git/objects", "test/fixtures/empty_repository__dot__git/objects/25", "test/fixtures/empty_repository__dot__git/objects/25/877ea00eb8d2de7a31cf7c4c4c16f0390d48fd", "test/fixtures/empty_repository__dot__git/objects/a0", "test/fixtures/empty_repository__dot__git/objects/a0/b6af2541dce8f646276ec7340695c34c7578aa", "test/fixtures/empty_repository__dot__git/objects/ec", "test/fixtures/empty_repository__dot__git/objects/ec/9e2a7b50ee2dfd5e6f8b5224fb3d7a98a79558", "test/fixtures/empty_repository__dot__git/objects/info", "test/fixtures/empty_repository__dot__git/objects/pack", "test/fixtures/empty_repository__dot__git/refs", "test/fixtures/empty_repository__dot__git/refs/heads", "test/fixtures/empty_repository__dot__git/refs/heads/master", "test/fixtures/empty_repository__dot__git/refs/tags", "test/fixtures/markdown.html", "test/fixtures/markdown.txt", "test/fixtures/mt_textformat_menu.png", "test/markout_document_test.rb", "test/markout_formatter_test.rb", "test/markout_history_test.rb", "test/markout_html_test.rb", "test/markout_output_test.rb", "test/markout_revision_test.rb", "test/markout_test.rb", "test/test_helper.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/karmi/markout}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Sexy Markdown output}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<schacon-grit>, [">= 0"])
      s.add_runtime_dependency(%q<rdiscount>, [">= 0"])
      s.add_runtime_dependency(%q<mime-types>, [">= 0"])
    else
      s.add_dependency(%q<schacon-grit>, [">= 0"])
      s.add_dependency(%q<rdiscount>, [">= 0"])
      s.add_dependency(%q<mime-types>, [">= 0"])
    end
  else
    s.add_dependency(%q<schacon-grit>, [">= 0"])
    s.add_dependency(%q<rdiscount>, [">= 0"])
    s.add_dependency(%q<mime-types>, [">= 0"])
  end
end
