Gem::Specification.new do |s|
  s.name = "fugazi"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Alexander Ivanov"]
  s.date = "2015-10-11"
  s.description = "A simple gem providing a dsl for defining and initializing class fields"
  s.email = "alehander42@gmail.com"
  s.executables = []
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "LICENSE",
    "README.md",
    "Rakefile",
    "lib/fugazi.rb",
    "fugazi.gemspec"
  ]
  s.homepage = "http://github.com/alehander42/fugazi"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "A simple gem providing a dsl for defining and initializing class fields"

  if s.respond_to? :specification_version then
    s.specification_version = 4
    s.add_development_dependency(%q<rspec>, ["= 3.3.0"])
  end
end
