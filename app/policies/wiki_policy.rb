class WikiPolicy < ApplicationPolicy

  def index?
     true
  end

  def show?
    (user.present? && ((user.role == 'premium') || (user.role == 'admin'))) || record.private != true
  end

  def edit?
    (user.present? && record.user_id == user.id)
  end

  def destroy?
    edit?
  end

end
