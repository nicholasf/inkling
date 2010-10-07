class Inkling::Theme < ActiveRecord::Base
  include FileUtils
  set_table_name "inkling_themes"

  validates_uniqueness_of :name
  
  after_save :check_init
  after_save :write_file
  after_destroy :delete_file
  
  @@path = "tmp/inkling/themes/"
    
  def write_file
    File.open("#{@@path}#{self.file_name}", "w") {|f| f.write(self.body)}
  end
  
  def check_init
    mkdir(@@path) unless File.exist?(@@path)
    mkdir("#{@@path}themes") unless File.exist?("#{@@path}themes") 
  end
  
  def delete_file
    rm("#{@@path}#{self.file_name}")
  end
  
  def file_name
    "#{self.name}#{self.extension}"
  end
end