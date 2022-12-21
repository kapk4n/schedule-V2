require 'rails_helper'

RSpec.describe List, type: :model do
  subject {
    User.create(email: "example@mail.ru", password: "password", name: "asfa", role: 1)
    User.create(email: "example2@mail.ru", password: "password", name: "asfa2", role: 0)
    Teach.create(user_id: 1)
    Stud.create(user_id: 2)
    Predmet.create(teach_id: 1, name: "example")
    Schedule.create(time: 1, day: 1, predmet_id: 1)
    @a = List.create(predmet_id: 1, stud_id: 1, spisok: 'asd')
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "created?" do
    1 == List.count
  end
end
