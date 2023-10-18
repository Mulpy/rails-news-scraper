class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    # NOTE: Be explicit about which records you allow access to!
    true
  end

  def new?
    create?
  end

  def create?
    # NOTE: Be explicit about which records you allow access to!
    true
  end

  def destroy?
    # NOTE: Be explicit about which records you allow access to!
    record.user == user
  end
end
