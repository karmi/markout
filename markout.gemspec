# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{markout}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Karel Minarik"]
  s.date = %q{2009-03-30}
  s.default_executable = %q{markout}
  s.email = %q{karmi@karmi.cz}
  s.executables = ["markout"]
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["README.rdoc", "VERSION.yml", "bin/markout", "lib/markout", "lib/markout/document.rb", "lib/markout/formatter.rb", "lib/markout/formatters", "lib/markout/formatters/html", "lib/markout/formatters/html/html.rb", "lib/markout/formatters/html/templates", "lib/markout/formatters/html/templates/default", "lib/markout/formatters/html/templates/default/content.rhtml", "lib/markout/formatters/html/templates/default/print.css", "lib/markout/formatters/html/templates/default/screen.css", "lib/markout/formatters/pdf", "lib/markout/formatters/pdf/pdf.rb", "lib/markout/history.rb", "lib/markout/output.rb", "lib/markout/revision.rb", "lib/markout.rb", "test/fixtures", "test/fixtures/markdown.html", "test/fixtures/markdown.txt", "test/fixtures/mt_textformat_menu.png", "test/markout_document_test.rb", "test/markout_formatter_test.rb", "test/markout_html_test.rb", "test/markout_output_test.rb", "test/markout_test.rb", "test/test_helper.rb", "LICENSE"]
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
    else
    end
  else
  end
end
