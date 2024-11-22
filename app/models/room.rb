class Room < ApplicationRecord
  has_many :members
  has_secure_password
  before_create -> { self.uuid = SecureRandom.uuid }
end
