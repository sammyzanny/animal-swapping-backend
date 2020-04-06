class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :sales
    has_many :wishes

    def inventory
        self.sales.map do |sale| 
            item = Item.find(sale.item_id) 
            {name: item.name, img: item.img, required: sale.required.split(" ")}
        end
    end

    def wishlist
        self.wishes.map do |wish|
            Item.find(wish.item_id)
        end
    end
end
