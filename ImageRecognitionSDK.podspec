
Pod::Spec.new do |s|
  s.name             = 'ImageRecognitionSDK'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ImageRecognitionSDK.'

  s.homepage         = 'https://github.com/ag970898664@163.com/ImageRecognitionSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ag970898664@163.com' => 'zhang.liguo@icerno.com' }
  s.source           = { :git => 'https://github.com/ag970898664@163.com/ImageRecognitionSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.public_header_files = 'ImageRecognitionSDK/Classes/**/*.{h}'
  s.source_files = 'ImageRecognitionSDK/Classes/**/*.{h,m}'
  s.vendored_frameworks = 'ImageRecognitionSDK/Classes/**/*.{framework}'

  # s.resource_bundles = {
  #   'ImageRecognitionSDK' => ['ImageRecognitionSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
