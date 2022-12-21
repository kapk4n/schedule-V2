require 'rails_helper'

RSpec.describe Stud, type: :model do
  subject {
    User.create(email: "example@mail.ru", password: "password", name: "asfa", role: 1)
    Stud.new(user_id: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "created?" do
    1 == Stud.count
  end
end
