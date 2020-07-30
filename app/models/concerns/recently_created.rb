module RecentlyCreated
    extend ActiveSupport::Concern
  
    included do
        scope :recently_created, -> {
            recent_date = Date.today - 1
            where("created_at >= ?", recent_date)
        }
    end
  end