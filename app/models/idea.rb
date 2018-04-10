class Idea < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    validates :title, presence: true, uniqueness: { message: 'must be unique' }
    validates :description, presence: true
end
