class EntryPolicy < ApplicationPolicy
  # See https://actionpolicy.evilmartians.io/#/writing_policies
  #
  def index?
    user && user.has_role?(:maintainer) || user.has_role?(:developer)
  end

  def edit?
    check?(:update?)
  end

  def update?
    # here we can access our context and record
    (user.id == record.user_id)
  end

  def destroy?
    user.has_role? :maintainer
  end

  # Scoping
  # See https://actionpolicy.evilmartians.io/#/scoping
  #
  # relation_scope do |relation|
  #   next relation if user.admin?
  #   relation.where(user: user)
  # end
end
