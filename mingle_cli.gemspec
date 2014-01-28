$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'version'

Gem::Specification.new do |spec|
  spec.name             = 'mingle_cli'
  spec.version          = MingleCLI::VERSION
  spec.platform         = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 1.9.2'
  spec.authors          = ['Isaac Datlof']
  spec.email            = 'ike18t@gmail.com'

  spec.homepage         = 'http://github.com/ike18t/mingle_cli'
  spec.license          = 'MIT'
  spec.summary          = 'Command line interface to Mingle.'
  spec.description      = 'Command line interface to Mingle.'

  spec.files            = `git ls-files`.split($/)
  spec.test_files       = spec.files.grep(%r{^(test|spec|features)/})
  spec.executables      = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.extra_rdoc_files = ['LICENSE.txt', 'README.md']
  spec.require_paths    = ['lib']

  spec.add_runtime_dependency('activeresource')
  spec.add_runtime_dependency('main')
  spec.add_runtime_dependency('aescrypt')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('mocha')
  spec.add_development_dependency('fakeweb')
end
