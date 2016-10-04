require 'rails_helper'

RSpec.describe User, type: :model do
  it "has valid attributes" do
    expect(User.new(:name, :email, :password)).to be_valid
  end

  it "has empty email" do
    u = User.new(:email=> nil)
    expect(u).not_to be_valid
  end
  
  it "has empty name" do
    u = User.new(:name=> nil)
    expect(u).not_to be_valid
  end
  
  it "has passwords that dont match" do
    u = User.new(:password => "p1", :confirmation => "p2")
    expect(u).not_to be_valid
  end
  
  it "username already taken" do
    u = User.new(:name, :password, :email)
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
