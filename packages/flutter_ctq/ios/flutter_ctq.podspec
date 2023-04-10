#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_ctq.podspec` to validate before publishing.
#
framework_name = 'Ctq.xcframework'
local_zip_name = "#{framework_name}.zip"
`
cd Frameworks
rm -rf #{framework_name}

unzip #{local_zip_name}
cd -
`

Pod::Spec.new do |s|
  s.name             = 'flutter_ctq'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.vendored_frameworks = "Frameworks/#{framework_name}"
  s.library = 'stdc++'

  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
end
