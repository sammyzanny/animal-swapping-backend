class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :sales
    has_many :wishes
    has_many :items
    has_many :purchase_requests, class_name: "Request", foreign_key: "buyer_id"
    has_many :customer_requests, class_name: "Request", foreign_key: "seller_id"
    # has_many :vendors, through: :purchase_requests, class_name: "User", foreign_key: "seller_id" 
    # has_many :customers, through: :customer_requests, class_name: "User", foreign_key: "buyer_id" 


    def purchases
        self.purchase_requests.select{|purchase| purchase.status == "accepted"}.map{|purchase| {id: purchase.id, otherUser: purchase.seller, item: purchase.item} }
    end

    def pending_purchases
        self.purchase_requests.select{|purchase| purchase.status == "pending"}.map{|purchase| {id: purchase.id, otherUser: purchase.seller, item: purchase.item} }
    end

    def exchanges 
        self.customer_requests.select{|purchase| purchase.status == "accepted"}.map{|purchase| {id: purchase.id, otherUser: purchase.buyer, item: purchase.item} }
    end

    def pending_exchanges
        self.customer_requests.select{|purchase| purchase.status == "pending"}.map{|purchase| {id: purchase.id, otherUser: purchase.buyer, item: purchase.item} }
    end

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
