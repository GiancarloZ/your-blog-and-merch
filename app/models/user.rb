class User < ActiveRecord::Base
    has_many :comments
    has_many :posts

    has_many :cart_items
    has_many :items, through: :cart_items
    
    has_secure_password
    validates :email, presence: true

    has_and_belongs_to_many :oauth_credentials
    devise :omniauthable, omniauth_providers: [:google_oauth2]

    def self.from_omniauth(access_token)
        data = access_token.info
        @user = User.where(email: data['email']).first
    
        # Uncomment the section below if you want users to be created if they don't exist
        unless @user
            @user = User.create(email: data['email'],
               password: Devise.friendly_token[0,20]
            )
        end
        @user
    end

end
