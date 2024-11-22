class Room < ApplicationRecord
  has_many :members, primary_key: :uuid
  has_secure_password
  before_create -> { self.uuid = SecureRandom.uuid }
end
