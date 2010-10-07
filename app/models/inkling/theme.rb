#maintain one record which will theme the entire site for now

class Inkling::Theme < ActiveRecord::Base
  include FileUtils
  set_table_name "inkling_themes"

  validates_uniqueness_of :name
  
  after_save :check_init
  after_save :write_file
  after_destroy :delete_file
  
  @@inkling_path = "tmp/inkling/"
  @@theme_path = "#{@@inkling_path}themes/"
  
  @@default = <<-DEFAULT
<html>
<head>
  <title>Inkling</title>
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
 
  def self.site
    if Inkling::Theme.all.empty?
      @@theme = self.create!(:name => "site", :body => @@default)
    end
    Inkling::Theme.first
  end
  
  # def self.site_file
  #   
  # end
    
  def write_file
    File.open("#{@@theme_path}#{self.file_name}", "w") {|f| f.write(self.body)}
  end
  
  def check_init
    mkdir(@@inkling_path) unless File.exist?(@@inkling_path)
    mkdir("#{@@theme_path}") unless File.exist?("#{@@theme_path}") 
  end
  
  def delete_file
    rm("#{@@theme_path}#{self.file_name}")
  end
  
  def file_name
    "#{self.name}#{self.extension}"
  end
end