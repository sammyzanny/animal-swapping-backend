class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :sales
    has_many :wishes
    has_many :items

    def inventory
        self.sales.map do |sale| 
            item = Item.find(sale.item_id) 
            {id: item.id, name: item.name, img: item.img, category: item.category, saleId: sale.id}
        end.sort_by{|x| x[:category]}
    end

   

    def wishlist
        self.wishes.map do |wish|
            item = Item.find(wish.item_id)
            {id: item.id, name: item.name, img: item.img, category: item.category, wishId: wish.id}
        end.sort_by{|x| x[:category]}
    end
end
