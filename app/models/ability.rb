class Ability
  include CanCan::Ability

  def initialize(user)
    return can :manage, :all if user.is_root?
    return unless user.role

    user.role.permissions.each do |subject, actions|
      can actions.map(&:to_sym),
          (klass = subject.classify.safe_constantize) ? klass : subject.to_sym
    end
  end
end
