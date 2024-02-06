class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_fee_burden
  belongs_to :origin_region
  belongs_to :days_to_ship

  has_one_attached :image
  belongs_to :user
  # has_one :order

  validates :item_name, presence: true
  validates :item_name, length: { maximum: 40, message: 'は40文字以下で入力してください' }
  validates :description, presence: true
  validates :description, length: { maximum: 1000, message: 'は1000文字以下で入力してください' }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, numericality: { only_integer: true, message: 'は半角数値で入力してください' }

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_fee_burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :origin_region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }

  validate :validate_image_presence

  def validate_image_presence
    errors.add(:image, 'を添付してください') unless image.attached?
  end
end
