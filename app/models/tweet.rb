class Tweet < ApplicationRecord
    belongs_to :user
    has_many :repplies, dependent: :destroy
    validates :text, presence: true, length: { minimum: 2, maximum:30 }
    
end
