class ClientPolicy < ApplicationPolicy
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

  private

  def is_user_the_owner?
    record.user_id == user.id

  end
end

