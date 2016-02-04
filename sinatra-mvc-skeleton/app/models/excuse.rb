class Excuse < ActiveRecord::Base
  belongs_to :creator,
  validates :body,    { presence: true }
  validates :creator, { presence: true}
end
