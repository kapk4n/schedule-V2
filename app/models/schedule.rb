class Schedule < ApplicationRecord
  belongs_to :predmet

  enum day: %i[Monday Tuesday Wednesday Thursday Friday Saturday]
  default_scope { order(time: :asc) }
  translate_enum :day
end
