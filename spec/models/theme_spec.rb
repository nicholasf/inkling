require File.dirname(__FILE__) + '/../spec_helper'
require 'differ'

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
    file = File.open("tmp/inkling/themes/#{theme.file_name}", "rb")
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
end
