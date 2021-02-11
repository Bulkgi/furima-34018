class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,         format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'パスワードは6文字以上の半角英数字にしてください'}
  with_options presence: true, format:{ with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name       
    validates :last_name
  end
  with_options presence: true, format:{ with: /\A[ァ-ヶ]+\z/, message: '全角カナ文字を使用してください' } do
    validates :first_name_ruby 
    validates :last_name_ruby
  end
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
         
end
