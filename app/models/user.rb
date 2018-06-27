class User < ApplicationRecord
    ROLE_ADMIN = 'admin'.freeze
    ROLE_USER = 'user'.freeze

    # Include default devise modules. Others available are:
    # :registerable, :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

    before_save :set_role

    def has_role? role
        self.role.eql? role
    end

    def before_import_save record
        self.password = '1linkwok@'
        self.password_confirmation = '1linkwok@'
    end

    private

        def set_role
            self.role ||= User::ROLE_USER
        end
end
