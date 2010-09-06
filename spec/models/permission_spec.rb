require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Permission do
  let(:foo) {ContentTypes::Foo.create(:name => "1")}
  let(:user) {Inkling::User.create!(:email => "admin@localhost.com", :password => "test123", :password_confirmation => "test123")}  

  it "should let an administrator have automatic manage permission over foo" do
    # let(:admin_role) {Inkling::Role.create(:name => Inkling::Role::ADMIN)}
    # let(:user) {Inkling::User.create!(:email => "admin@localhost.com", :password => "test123", :password_confirmation => "test123")}  
    # let(:membership) {Inkling::RoleMembership.create!(:user => user, :role => admin_role)}
    
    create_role_and_membership(Inkling::Role::ADMIN, user)

    ability = Inkling::Ability.new(user)
    ability.can?(:manage, ContentTypes::Foo).should be_true
  end
  
  it "should apply CRUD based perm.s via the role to the user on the content type" do
    create_role_and_membership("content_editor", user)
    
    permission = Inkling::Permission.create(:path => foo.path, :role => role, :action => :update)
    ability = Inkling::Ability.new(user)
    ability.can?(:update, ContentTypes::Foo).should be_true
  end
  
  
  def create_role_and_membership(role_name, user)
    role = Inkling::Role.create(:name => role_name)
    membership = Inkling::RoleMembership.create!(:user => user, :role => role) 
    role
  end
end
