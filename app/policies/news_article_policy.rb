class NewsArticlePolicy < ApplicationPolicy
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
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def scrape_bbc?
    true
  end

  def sort_bbc?
    true
  end
end
