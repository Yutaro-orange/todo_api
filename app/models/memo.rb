class Memo < ApplicationRecord
    belongs_to :category
    validates :category, :content, presence: true
end