class Quote < ActiveRecord::Base
    validates :title, presence: true,
                    length: { minimum: 5 }
    def refresh
    end
end
