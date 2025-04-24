class Memo < ApplicationRecord
    belongs_to :category
    belongs_to :user
    validates :category, :content, presence: true
end