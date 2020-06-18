require_relative 'lib/jekyll/cloudflare/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-cloudflare"
  spec.version       = Jekyll::Cloudflare::VERSION
  spec.authors       = ["Bodacious"]
  spec.email         = ["bodacious@katanacode.com"]

  spec.summary       = %q{Clear the CloudFlare cache after updating Jekyll site}
  spec.description   = %q{Clear CloudFlare cache after deploying new Jekyll static site files}
  spec.homepage      = "https://github.com/katanacode/jekyll-cloudflare"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
