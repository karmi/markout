# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{markout}
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Karel Minarik"]
  s.date = %q{2009-04-13}
  s.default_executable = %q{markout}
  s.email = %q{karmi@karmi.cz}
  s.executables = ["markout"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "README.rdoc",
    "VERSION.yml",
    "lib/markout.rb",
    "lib/markout/document.rb",
    "lib/markout/formatter.rb",
    "lib/markout/formatters/html/html.rb",
    "lib/markout/formatters/html/templates/common/application.js",
    "lib/markout/formatters/html/templates/common/code.css",
    "lib/markout/formatters/html/templates/common/code_highlighter.js",
    "lib/markout/formatters/html/templates/common/jquery-1.3.2.min.js",
    "lib/markout/formatters/html/templates/common/syntax_diff.js",
    "lib/markout/formatters/html/templates/default/content.rhtml",
    "lib/markout/formatters/html/templates/default/print.css",
    "lib/markout/formatters/html/templates/default/screen.css",
    "lib/markout/formatters/pdf/pdf.rb",
    "lib/markout/history.rb",
    "lib/markout/output.rb",
    "lib/markout/revision.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/karmi/markout}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Sexy Markdown output}
  s.test_files = [
    "test/markout_document_test.rb",
    "test/markout_formatter_test.rb",
    "test/markout_history_test.rb",
    "test/markout_html_test.rb",
    "test/markout_output_test.rb",
    "test/markout_revision_test.rb",
    "test/markout_test.rb",
    "test/test_helper.rb"
  ]

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
