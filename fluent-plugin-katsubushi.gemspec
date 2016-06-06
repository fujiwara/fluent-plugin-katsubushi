# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-katsubushi"
  spec.version       = "0.1.0"
  spec.authors       = ["FUJIWARA Shunichiro"]
  spec.email         = ["fujiwara.shunichiro@gmail.com"]

  spec.summary       = %q{A fluentd filter plugin to inject id getting from katsubushi.}
  spec.description   = %q{A fluentd filter plugin to inject id getting from katsubushi.}
  spec.homepage      = "https://github.com/fujiwara/fluent-plugin-katsubushi"
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_dependency "memcached", "~> 1.8.0"
end
