class Item < ApplicationRecord
    has_many :sales
    has_many :wishes

   
end