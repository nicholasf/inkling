class Inkling::Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role?(:administrator)
      can :manage, :all
    else
      for role in user.roles
        role.permissions.each do |permission|
          can permission.action.to_sym, permission.path.content_type.constantize
        end
      end
    end
  end
end
