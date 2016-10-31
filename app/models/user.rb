require 'bcrypt'
class User < ApplicationRecord
    include BCrypt
    before_create :confirmation_token
    before_save :encrypt_password
    
    validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :email, :presence => true, :uniqueness => true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    validates :password, :confirmation => true 
    validates_length_of :password, :in => 6..20, :on => :create
    validates_length_of :password, :in => 6..20, :on => :password
    
    def profile_image
        
        
        
        #File Upload has been deprecated, heroku doesn't support file uploading
        #
        #file = "assets/profile_images/"+name+".jpg"
        #if !File.exist?(Rails.root + "public"  + file)
        #    return "/assets/user2-160x160.jpg" 
        #else
        #    return "/"+file
        #end
    end
    
    def email_activate
        self.confirmed_email = true
        self.confirm_token = nil
        save!(:validate => false)
    end

    def encrypt_password
        if password.present? && salt.nil?
            self.salt = BCrypt::Engine.generate_salt
            self.password = BCrypt::Engine.hash_secret(password, salt)
        end
      
    end
    
    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end
    
    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end
    
    def send_password_reset
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        save!
        UserMailer.password_reset(self).deliver
    end
    
    private :encrypt_password, :confirmation_token, :generate_token
    
end
    
