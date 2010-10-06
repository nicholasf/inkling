class Inkling::Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role?(:administrator)
      can :manage, :all
    else
      for role in user.roles
        for permission in role.permissions    
          can permission.can_can_action.name.to_sym, permission.type.klass_name.constantize
        end
      end
      # for role in user.roles
      #   role.permissions.each do |permission|
      #     can permission.action.to_sym, permission.path.content_type.constantize
      #   end
      # end
    end
  end
end

