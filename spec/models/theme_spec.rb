require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Theme do
  
  default = <<-DEFAULT
<html>
<head>
  <title>Inkling Administration</title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
</head>
<body>


<div id="header">
	<div id="logo">
		<h1><%= link_to 'Inkling', inkling_user_root_path %></h1>
	</div>
	<div id="tabs">
		<%= link_to 'Home', inkling_user_root_path %> | <%= link_to 'Tree', inkling_paths_path %>
	</div>
</div>

<div class="notice"><%= notice %></div>
<div class="alert"><%= alert %></div>

<div id="page">
  <div id="main">
      <%= yield %> 
  </div>
</div>

<div id="footer">
  <span id="version" align='center'>Inkling version <%= Inkling::VERSION %></span>
</div>


</body>
</html>
  DEFAULT
      
  let(:theme) {Inkling::Theme.create!(:name => "default", :body => default)}
  
  it "should write the theme to the tmp/inkling/themes directory" do
    theme
    lines = []
    file = File.open("tmp/inkling/themes/layouts/#{theme.file_name}", "rb")
    contents =  file.read
    
    file_words = contents.split(/\W/)
    theme_words = theme.body.split(/\W/)
    file_words.size.should == theme_words.size

    i = 0
    for word in theme_words
      word.should == file_words[i]
      i += 1
    end
  end
  
  it "should delete the file when the theme model is deleted" do
    theme.destroy
    File.exist?("tmp/inkling/themes/#{theme.file_name}").should be_false  
  end
  
  it "should take a directory and create themes for each file within it" do
    include FileUtils
    name = Time.now.to_i.to_s
    tmp_dir = "/tmp/#{name}"
    FileUtils.mkdir_p(tmp_dir)
    system("touch /tmp/#{name}/main.erb.html")
    system("touch /tmp/#{name}/footer.erb.html")
    system("echo 'this is main' >> /tmp/#{name}/main.erb.html")
    system("echo 'this is footer' >> /tmp/#{name}/footer.erb.html")
    Inkling::Theme.install_from_dir(tmp_dir)
    main = Inkling::Theme.find_by_name("main")
    footer = Inkling::Theme.find_by_name("footer")
    main.body.strip.should == "this is main"
    footer.body.strip.should == "this is footer"
    FileUtils.rm_rf(tmp_dir)
  end
end
