
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "calulator/api/test/version"

Gem::Specification.new do |spec|
  spec.name          = "calulator-api-test"
  spec.version       = Calulator::Api::Test::VERSION
  spec.authors       = ["Dilshan Fernando"]
  spec.email         = ["dilshan.fdo@gmail.com"]

  spec.summary       = %q{Simple Calculator API validator with Cucumber}
  spec.description   = %q{calculator-api-test allows API JSON response validation and verification in BDD style.}
  spec.homepage      = "https://github.com/dilshan5/calulator-api-test"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency("bundler", "~> 1.16")
  spec.add_development_dependency("rake", "~> 10.0")
end
