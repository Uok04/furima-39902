class OrderShoppingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :origin_region_id, :municipality, :street_address, :building_name,
                :phone_number, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :origin_region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :street_address
    validates :phone_number, length: { in: 10..11 },
                             format: { with: /\A\d{10,11}\z/, message: 'must be a number without hyphen.' }
    validates :token
    # validates :order_id
  end

  def save
    order = Order.create(user_id:, item_id:)
    ShoppingAddress.create(postal_code:, origin_region_id:, municipality:,
                           street_address:, building_name:, phone_number:, order_id: order.id)
  end
end
