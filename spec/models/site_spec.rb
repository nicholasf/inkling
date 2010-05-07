require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Site do

  before(:each) do
    clean  
  end

  it "should validate on the uniquness of a name" do
    site = Inkling::Site.new
    site.valid?.should be true
    site.name = "blurg"
    site.save
    site.valid?.should be true
    site2 = Inkling::Site.new
    site2.name = "blurg"
    site2.valid?.should be false
  end
end
