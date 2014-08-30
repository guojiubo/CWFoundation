#
#  Be sure to run `pod spec lint CWFoundation.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "CWFoundation"
  s.version      = "0.0.2"
  s.summary      = "CWFoundation is a collection of utility methods and category extensions for Foundation and UIKit classes to accelerate development."
  s.homepage     = "https://github.com/guojiubo/CWFoundation"
  s.license      = "MIT"
  s.author       = { "guojiubo" => "guojiubo@gmail.com" }
  s.platform     = :ios
  s.platform     = :ios, "6.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/guojiubo/CWFoundation.git", :tag => "0.0.2" }
  s.source_files = "CWFoundation/*"
  s.frameworks = 'Foundation', 'UIKit'

end
