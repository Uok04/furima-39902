class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "は正しい形式で入力してください" }
  validates :encrypted_password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).+\z/, message: "は半角英数字混合で入力してください" }
  validates :last_name, presence: true, presence: true, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}\p{blank}ー－]+\z/, message: "は全角文字で入力してください" }
  validates :first_name, presence: true, presence: true, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}\p{blank}ー－]+\z/, message: "は全角文字で入力してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "は全角カタカナで入力してください" }
  validates :birthday, presence: true

end
