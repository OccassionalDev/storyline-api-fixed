class User < ApplicationRecord
    has_secure_password
    has_secure_password :recovery_password, validations: false

    validates_presence_of :username, :email
    validates_uniqueness_of :email, :username

    has_many :stories
    has_many :characters
    has_many :comments
end
