require 'rails_helper'

RSpec.describe User, type: :model do
  subject {described_class.new(name: "Any Name", email: "email@123.com", password: "123456")}
  
  it "triggers confirmation_token before_create" do
    expect(subject).to receive(:confirmation_token)
    subject.save
  end
  
  it "triggers encrypt_password before_save" do
    expect(subject).to receive(:encrypt_password)
    subject.save
  end
  
  it "#confirmation_token should create confirm_token" do
    expect(subject.confirm_token).not_to be blank?
  end
  
  it "#encrypt_password should encrypt password and generate salt" do
    subject.save
    expect(subject.salt).not_to be_nil
    expect(subject.password).not_to be_nil
  end
  
  it "#encrypt_password should encrypt correctly" do
    @password = '123456'
    @user = User.new(name: "Guilherme", email: "guilherme_oliveira55@hotmail.com", password: @password)
    @user.save
    @password = BCrypt::Engine.hash_secret(@password, @user.salt)
    expect(@password).to eq(@user.password)
  end
  
  it "#email_activate activates email correctly" do
    subject.save
    subject.email_activate
    expect(subject.confirm_token).to be_nil
    expect(subject.confirmed_email).to be true
  end
  
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
    expect(user_test).to be_nil
  end
  
  it "email already taken" do
    user_test = User.find_by email: subject.email
    expect(user_test).to be_nil
  end
  
  it "password too short" do
    expect(subject.password.length).to be(6)
  end
  
  it "has no uploaded image" do
    #expect(subject.profile_image).to eq("/assets/user2-160x160.jpg")
  end
  
end
