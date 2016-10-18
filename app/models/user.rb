require 'bcrypt'
class User < ApplicationRecord
    include BCrypt
    before_create :confirmation_token
    before_save :encrypt_password
    
    validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :email, :presence => true, :uniqueness => true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    validates :password, :confirmation => true
    validates_length_of :password, :in => 6..20
    
    def email_activate
        self.confirmed_email = true
        self.confirm_token = nil
        save!(:validate => false)
    end
    
    private
    def encrypt_password
        if password.present? && salt.nil?
            self.salt = BCrypt::Engine.generate_salt
            self.password = BCrypt::Engine.hash_secret(password, salt)
        end
      
    end
    
    private
    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end
    
end
    
