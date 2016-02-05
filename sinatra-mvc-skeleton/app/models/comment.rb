class Comment < ActiveRecord::Base
  belongs_to :commenter, { class_name: "User" }
  belongs_to :excuse

  validates  :body,      { presence: true }
  validates  :commenter, { presence: true }
  validates  :excuse,    { presence: true }
end
