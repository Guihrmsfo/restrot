require 'rails_helper'

RSpec.describe User, type: :model do
  it "has valid attributes" do
    expect(User.new).to be_valid
  end

  it "has empty email" do
    u = User.new(:email=> nil)
    expect(u).to have(1).errors_on(:email)
  end
  
  it "has empty name" do
    u = User.new(:name=> nil)
    expect(u).to have(1).errors_on(:name)
  end
  
  it "has passwords that dont match" do
    u = User.new(:password => "p1", :confirmation => "p2")
    expect(u).to have(1).errors_on(:password)
  end
  
  it "username already taken" do
    u = User.new(:name)
    user_test = User.find_by name: u.name
    expect(user_test).to be_nill
  end
  
  it "email already taken" do
    u = User.new(:email)
    user_test = User.find_by name: u.email
    expect(user_test).to be_nill
  end
  
  it "password too short" do
    u = User.new(:password)
    expect(u.password).to have(6).characters
  end
end
