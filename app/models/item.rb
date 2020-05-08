class Item < ApplicationRecord
    has_many :sales
    has_many :wishes
    has_many :requests
    belongs_to :user, optional: true
    # validates :name, uniqueness: { case_sensitive: false }
end