lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pdf_extractor/version"

Gem::Specification.new do |spec|
  spec.name          = 'pdf_extractor'
  spec.version       = PdfExtractor::VERSION
  spec.authors       = ['Jindrich Skupa']
  spec.email         = ['jindrich.skupa@gmail.com']

  spec.summary       = %q(PDFTk wrapper to extract form fiels)
  spec.description   = %q(PDFTk wrapper to extract form fiels)
  spec.homepage      = 'https://github.com/jindrichskupa/pdf-extractor'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-reporters-json_reporter', '~> 1.0', '>= 1.0.0'
  spec.add_development_dependency 'nexus', '~> 1.4', '>= 1.4.0'
  spec.add_development_dependency 'rubocop', '~> 0.58', '>= 0.58.2'
  spec.add_development_dependency 'simplecov', '~> 0.16', '>= 0.16.1'
  spec.add_development_dependency 'rake', '~> 13.0'
end
