require 'rails_helper'

RSpec.describe User, type: :model do
  subject {described_class.new(name: "Any Name", email: "email@123", password: "123456")}
  it "has valid attributes" do
    expect(subject).to be_valid
  end

  it "has empty email" do
    subject.email = nil
    expect(subject).not_to be_valid
  end
  
  it "has empty name" do
    subject.name = nil
    expect(subject).not_to be_valid
  end
  
  it "username already taken" do
    user_test = User.find_by name: subject.name
    expect(user_test).to be_nill
  end
  
  it "email already taken" do
    user_test = User.find_by email: subject.email
    expect(user_test).to be_nill
  end
  
  it "password too short" do
    expect(subject.password).to have(6).characters
  end
end
