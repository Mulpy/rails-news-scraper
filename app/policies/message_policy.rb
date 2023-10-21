class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    # NOTE: Be explicit about which records you allow access to!
    true
  end

  def show?
    # NOTE: Be explicit about which records you allow access to!
    true
  end
end
