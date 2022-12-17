class Stud < ApplicationRecord
  belongs_to :user
  has_many :list, dependent: :destroy
end
