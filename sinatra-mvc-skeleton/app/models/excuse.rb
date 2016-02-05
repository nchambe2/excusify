class Excuse < ActiveRecord::Base
  belongs_to :creator, { class_name: "User" }
  has_many   :comments
  validates  :body,     { presence: true }
  validates  :creator,  { presence: true}
end
