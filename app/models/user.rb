class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,         format:{ with: /[a-z\d]/i, message: 'パスワードは6文字以上の半角英数字にしてください'}
  validates :nickname,         presence: true
  with_options presence: true, format:{ with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name       
    validates :last_name
    validates :first_name_ruby 
    validates :last_name_ruby
  end
  validates :birthday,         presence: true
         
end
