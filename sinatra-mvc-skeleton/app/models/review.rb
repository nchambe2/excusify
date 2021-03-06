class Review < ActiveRecord::Base
  belongs_to :excuse
  belongs_to :reviewer, { class_name: "User"}
  validates  :excuse,   { presence: true }
  validates  :reviewer,   { presence: true }
end