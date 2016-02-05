class Review < ActiveRecord::Base
  belongs_to :excuse
  belongs_to :reviewer, { class_name: "User"}

  validates  :rating,   { presence: true }
  validates  :excuse,   { presence: true }
  validates  :reviewer,   { presence: true }
end