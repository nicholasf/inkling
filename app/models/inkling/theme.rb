class Inkling::Theme < ActiveRecord::Base
  include FileUtils
  set_table_name "inkling_themes"

  validates_uniqueness_of :name
  
  after_save :check_init
  after_save :write_file
  after_destroy :delete_file
    
  def write_file
    File.open("tmp/inkling/themes/#{self.file_name}", "w") {|f| f.write(self.body)}
  end
  
  def check_init
    mkdir("tmp/inkling") unless File.exist?("tmp/inkling")
    mkdir("tmp/inkling/themes") unless File.exist?("tmp/inkling/themes") 
  end
  
  def file_name
    "#{self.name}#{self.extension}"
  end
end