class User < ActiveRecord::Base
    has_many :quotes, dependent: :destroy
    before_save { self.email = email.downcase }
    has_secure_password
    EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
    validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
    validates :password_confirmation, :presence => true

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

end
