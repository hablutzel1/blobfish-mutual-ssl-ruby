lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "blobfish/ssl/version"

Gem::Specification.new do |spec|
  spec.name          = "blobfish-mutual-ssl-ruby"
  spec.version       = Blobfish::Ssl::VERSION
  spec.authors       = ["Jaime Hablutzel"]
  spec.email         = ["hablutzel1@gmail.com"]

  spec.summary       = "Middleware to obtain client certificate during mutual SSL."
  spec.homepage      = "https://github.com/hablutzel1/blobfish-mutual-ssl-ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.16"
end
