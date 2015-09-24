class Quote < ActiveRecord::Base
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :title, presence: true
    validates :text, presence: true, length: { maximum: 140 }
    def refresh
    end    
end
