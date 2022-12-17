class List < ApplicationRecord
  belongs_to :stud
  belongs_to :predmet

  def jresult
    ActiveSupport::JSON.decode(spisok)
  end
end
