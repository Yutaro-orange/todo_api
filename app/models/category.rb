class Category < ApplicationRecord
    has_many :memos
    validates :name, presence: :true
end