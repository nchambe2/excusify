class User < ActiveRecord::Base
  has_many  :excuses,    { foreign_key: :creator_id}
  validates :first_name, { presence: true }
  validates :last_name,  { presence: true }
  validates :email,      { presence: true, uniqueness: true }

  def password=(plaintext_password)
    @password = BCrypt::Password.create(plaintext_password)
    self.password_hash = @password
  end

  def password
   @password = BCrypt::Password.new(self.password_hash)
  end

  def authenticate(plaintext_password)
    self.password == plaintext_password
  end
end
