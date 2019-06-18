class PostPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id || user.type == admin_types.include?(user.type)
  end
end