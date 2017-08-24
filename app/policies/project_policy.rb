class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def index_direct?
    true
  end
end
