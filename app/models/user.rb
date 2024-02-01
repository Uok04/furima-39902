class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "は正しい形式で入力してください" }
  validates :encrypted_password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).+\z/, message: "must include both letters and numbers" }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :last_name, presence: true, presence: true, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}\p{blank}ー－]+\z/, message: "must be in full-width characters" }
  validates :first_name, presence: true, presence: true, format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}\p{blank}ー－]+\z/, message: "must be in full-width characters" }
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "must be in full-width katakana" }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "must be in full-width katakana" }
  validates :birthday, presence: true


end
