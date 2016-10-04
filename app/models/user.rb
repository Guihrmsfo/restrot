require 'bcrypt'
class User < ApplicationRecord
    include BCrypt
    before_save :encrypt_password
    
    validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :email, :presence => true, :uniqueness => true
    validates :password, :confirmation => true
    validates_length_of :password, :in => 6..20, :on => :create
    
    def encrypt_password
      if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.password = BCrypt::Engine.hash_secret(password, salt)
      end
      
    end
end
    
