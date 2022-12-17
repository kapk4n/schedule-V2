class Teach < ApplicationRecord
  belongs_to :user
  has_one :predmet
end
