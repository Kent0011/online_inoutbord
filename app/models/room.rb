class Room < ApplicationRecord
  has_secure_password
  before_create -> { self.uuid = SecureRandom.uuid }
end
