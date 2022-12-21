require 'rails_helper'

RSpec.describe Schedule, type: :model do
  subject {
    User.create(email: "example@mail.ru", password: "password", name: "asfa", role: 1)
    Teach.create(user_id: 1)
    Predmet.create(teach_id: 1, name: "example")
    Schedule.create(time: 1, day: 1, predmet_id: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "created?" do
    1 == Schedule.count
  end
end
