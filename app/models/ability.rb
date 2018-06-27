class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new

        if user.has_role? User::ROLE_ADMIN
            can :access, :rails_admin
            can :read, :dashboard
            can :manage, :all
        end
    end
end
