class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    is_user_the_owner?
  end

  def destroy?
    is_user_the_owner?
  end

  def index_direct?
    true
  end

  def select?
    is_user_the_owner?
  end

  def list_tasks?
    record.each do |r|
      r.user == user
    end
  end

  private

  def is_user_the_owner?
    record.user == user
  end
end
