class Predmet < ApplicationRecord
  belongs_to :teach
  has_many :list
  has_many :schedule
end
