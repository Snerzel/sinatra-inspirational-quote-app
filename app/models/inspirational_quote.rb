class InspirationalQuote < ActiveRecord::Base
    belongs_to :user

    def readable_timestamps
        created_at.strftime( "%a %b %e %Y")
    end
end
