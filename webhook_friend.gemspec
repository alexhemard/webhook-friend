Gem::Specification.new do |gem|
  gem.authors       = ["Audiosocket"]
  gem.email         = ["tech@audiosocket.com"]
  gem.description   = "A friend 4 webhooks."
  gem.summary       = "A dumb app."
  gem.homepage      = "https://github.com/audiosocket/webhook-friend"
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- test/*`.split("\n")
  gem.name          = "webhook_friend"
  gem.require_paths = ["lib"]
  gem.version       = "1.0.0"

  gem.required_ruby_version = ">= 1.9.2"
end