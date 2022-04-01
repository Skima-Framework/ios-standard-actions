Pod::Spec.new do |s|
    s.name                  = 'SkimaStandardActions'
    s.version               = '0.1.0'
    s.homepage              = 'www.google.com'
    s.summary               = 'Skima Standard Actions - module'
    s.license               = { :type => 'MIT', :file => 'LICENSE.txt' }
    s.author                = 'Skima Framework'
    s.source                = { :path => '/Users/joaquinbozalla/Desktop/myProjects/SkimaStandardActions' }
    
    s.platform              = :ios, '11.0'
    s.requires_arc          = true
    s.swift_version         = '5.1'
    s.static_framework      = true
    
    s.source_files          = 'SkimaStandardActions/**/*.{h,swift}'
  
    s.dependency 'Skima'
  
  end
  
