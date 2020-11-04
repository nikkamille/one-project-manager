class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    has_many :tasks, dependent: :destroy
    has_many :projects, through: :tasks

    def self.from_omniauth(auth)
        
        @user = User.find_by(uid: auth['uid'])
        if @user.nil?
            @user = User.create(email: auth['info']['email'], username: auth['info']['name'], password: SecureRandom.hex, uid: auth['uid'], image: auth['info']['image'])
        elsif @user.uid.nil?
            @user.update(uid: auth['uid'])
        end 
        @user

    end 

end
