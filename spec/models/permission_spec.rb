require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Permission do

  let(:foo) {ContentTypes::Foo.create(:name => "1")}
  let(:admin_role) {Inkling::Role.create(:name => Inkling::Role::ADMIN)}
  let(:user) {Inkling::User.create!(:email => "admin@localhost.com", :password => "test123", :password_confirmation => "test123")}  
  let(:membership) {Inkling::RoleMembership.create!(:user => user, :role => admin_role)}
  

  it "administrator should have automatic manage permission over foo" do
    membership;
    
    ability = Inkling::Ability.new(user)
    ability.can?(:manage, ContentTypes::Foo).should be_true
  end
end
