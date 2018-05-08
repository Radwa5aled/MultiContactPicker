

Pod::Spec.new do |s|

  s.name         = "MultiContactPicker"
  s.version      = "1.0.1"
  s.summary      = "Multi Contact Picker  gives you the ability to access your contacts and return CNContact list"

 
  s.description  = "Multi Contact Picker  gives you the ability to access your contacts and return CNContact list, search,  select more than contact and view details of each contact"

   s.homepage     = "http://google.com.eg/"
 
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "Radwa Khaled" => "raadwa.khaled@gmail.com" }
    s.social_media_url   = "http://facebook.com/radwa.khaled.526"

  
    s.platform     = :ios, "11.0"

     s.source       = { :git => "https://github.com/Radwa5aled/MultiContactPicker.git", :tag => s.version }

    s.source_files  = "MultiContactPicker", "MultiContactPicker/**/*.{h,m,swift}"
 
    s.resources = "MultiContactPicker/*.{storyboard,xib,xcassets,json,imageset,png}"


   s.pod_target_xcconfig = { 'SWIFT_VERSION' => '>= 3.2, <= 4.0' }

 

end
