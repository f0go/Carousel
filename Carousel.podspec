Pod::Spec.new do |s|
  s.name        = "Carousel"
  s.version     = "1.0.0"
  s.summary     = "Just a simple images carousel"
  s.homepage    = "https://github.com/f0go/Carousel"
  s.license     = { :type => "MIT" }
  s.authors     = { "f0go" => "f0go.dev@gmail.com"}

  s.requires_arc = true
  s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/f0go/Carousel.git", :tag => s.version }
  s.source_files = "Source/*.swift"
end
