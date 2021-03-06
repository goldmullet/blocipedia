class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :visible_to, -> (user) { user && ((user.role == 'premium') || (user.role == 'admin')) ? all : where("private IS NULL or private = ?", false)  }

end
