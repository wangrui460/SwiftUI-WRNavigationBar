Pod::Spec.new do |spec|

  spec.name         = "SwiftUI-WRNavigationBar"
  spec.version      = "1.1.1"
  spec.summary      = "Custom navigationBar in SwiftUI"

  spec.description  = <<-DESC
                   easy navigationBar in SwiftUI
                        DESC

  spec.homepage     = "https://github.com/wangrui460/SwiftUI-WRNavigationBar"

  spec.license      = "MIT"

  spec.author             = { "wangrui460" => "wangruidev@gmail.com" }

  spec.platform     = :ios, "14.0"

  spec.source       = { :git => "https://github.com/wangrui460/SwiftUI-WRNavigationBar.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/*.swift"
  spec.resources     = 'Sources/*.{png,bundle}'

  spec.requires_arc = true

end
