require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Permission do
  let(:type) {Inkling::Type.create!(:klass_name => "String")}
  let(:user) {Inkling::User.create!(:email => "admin@localhost.com", :password => "test123", :password_confirmation => "test123")}  

  it "should let an administrator have automatic manage permission over foo" do    
    create_role_and_membership(Inkling::Role::ADMIN, user)

    ability = Inkling::Ability.new(user)
    ability.can?(:manage, String).should be_true
  end
  
  it "should apply CanCanAction based perm.s via the role to the user on the type" do
    role = create_role_and_membership("content_editor", user)
    update_action = Inkling::CanCanAction.create!(:name => "update")
    foo_update_permission = Inkling::Permission.create(:role_id => role.id, :can_can_action_id => update_action.id, :type_id => type.id)
    ability = Inkling::Ability.new(user)
    ability.can?(:update, String).should be_true
    ability.cannot?(:delete, String).should be_true    
  end
  
  
  def create_role_and_membership(role_name, user)
    role = Inkling::Role.create(:name => role_name)
    membership = Inkling::RoleMembership.create!(:user => user, :role => role) 
    role
  end
end
