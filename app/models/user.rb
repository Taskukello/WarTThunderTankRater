class User < ActiveRecord::Base

  
  
validate :password_complexity
validates :name, uniqueness: true
validates :name, length: {minimum: 3, maximum: 12}
validates :password, length: {minimum: 5}
has_secure_password

def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])./)
      errors.add :password, "must include at least one lowercase letter, uppercase letter, and one digit"
    end

  end

end
