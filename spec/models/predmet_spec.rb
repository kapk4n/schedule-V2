require 'rails_helper'

RSpec.describe Predmet, type: :model do
  subject {
    User.create(email: "example@mail.ru", password: "password", name: "asfa", role: 1)
    Teach.create(user_id: 1)
    Predmet.new(teach_id: 1, name: "example")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "created?" do
    1 == Predmet.count
  end
end
