require 'rails_helper'

RSpec.describe User, type: :model do
  it "has valid attributes" do
    u = User.new(:name, :email, :password)
    expect(u).to be_valid
  end

  it "has empty email" do
    u = User.new(:name, :password, :email=> nil)
    expect(u).to have(1).errors_on(:email)
  end
  
  it "has empty name" do
    u = User.new(:email, :password, :name=> nil)
    expect(u).to have(1).errors_on(:name)
  end
  
  it "has passwords that dont match" do
    u = User.new(:name, :email, :password => "p1", :confirmation => "p2")
    expect(u).to have(1).errors_on(:password)
  end
  
  it "username already taken" do
    u = User.new(:name, :email, :password)
    user_test = User.find_by name: u.name
    expect(@user_test).to be_nill
  end
  
  it "email already taken" do
    u = User.new(:name, :email, :password)
    user_test = User.find_by name: u.name
    expect(@user_test).to be_nill
  end
  
  it "password too short" do
    u = User.new(:name, :email, :password)
    expect(u.password).to have(6).characters
    should validate_length_of(u.password).is_at_least(6)
  end
end
