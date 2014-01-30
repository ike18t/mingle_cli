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

  spec.add_runtime_dependency('activeresource', '~> 4.0')
  spec.add_runtime_dependency('main', '~> 5.2')
  spec.add_runtime_dependency('aescrypt', '~> 1.0')
  spec.add_development_dependency('rake', '~> 10.1')
  spec.add_development_dependency('rspec', '~> 2.14')
  spec.add_development_dependency('mocha', '~> 0.14')
  spec.add_development_dependency('fakeweb', '~> 1.3')
end
