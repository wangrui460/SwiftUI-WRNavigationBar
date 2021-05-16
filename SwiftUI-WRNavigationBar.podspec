Pod::Spec.new do |spec|

  spec.name         = "SwiftUI-WRNavigationBar"
  spec.version      = "1.0.0"
  spec.summary      = "Custom navigationBar in SwiftUI"

  spec.description  = <<-DESC
                   DESC

  spec.homepage     = "https://github.com/wangrui460/SwiftUI-WRNavigationBar"

  spec.license      = "MIT"

  spec.author             = { "wangrui460" => "wangruidev@gmail.com" }

  spec.platform     = :ios, "14.0"

  spec.source       = { :git => "https://github.com/wangrui460/SwiftUI-WRNavigationBar.git", :tag => "#{spec.version}" }

  spec.source_files  = ["Sources/**/*.swift"]

  spec.requires_arc = true

end
