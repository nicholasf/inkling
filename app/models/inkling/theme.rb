#maintain one record which will theme the entire site for now

class Inkling::Theme < ActiveRecord::Base
  include FileUtils
  set_table_name "inkling_themes"

  validates_uniqueness_of :name
  
  after_save :check_init
  after_save :write_file
  after_destroy :delete_file

    @@default_content = <<-DEFAULT
  <html>
  <head>
    <title>Your Inkling CMS</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
  </head>
  <body>

  This is the default theme for public users to view content on your site. <br/>
  
  An administrator should log into Inkling Administration and configure the 'content' theme. <br/>

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

  def self.content
    if Inkling::Theme.find_by_name("content").nil?
      self.create!(:name => "content", :body =>  @@default_content)
    end
    
    Inkling::Theme.find_by_name("content")
  end

  def self.site_theme_file
    "#{Inkling::THEME_LAYOUTS_DIR}#{self.site.file_name}"
  end
  
  #takes a directory and recursively interns all structures there as a theme structure
  # (just like any sub directory in app/views)
  def self.install_from_dir(dirname)
    
  end
    
  def write_file
    File.open("#{Inkling::THEME_LAYOUTS_DIR}#{self.file_name}", "w") {|f| f.write(self.body)}
  end
  
  def check_init
    mkdir(Inkling::TMP_DIR) unless File.exist?(Inkling::TMP_DIR)
    mkdir("#{Inkling::THEMES_DIR}") unless File.exist?("#{Inkling::THEMES_DIR}") 
    mkdir("#{Inkling::THEME_LAYOUTS_DIR}") unless File.exist?("#{Inkling::THEME_LAYOUTS_DIR}") 
  end
  
  def delete_file
    rm("#{Inkling::THEME_LAYOUTS_DIR}#{self.file_name}")
  end
  
  def file_name
    "#{self.name}#{self.extension}"
  end
end