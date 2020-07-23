module RecentlyCreated
    extend ActiveSupport::Concern
  
    included do
        scope :recently_created, -> {
            recent_date = DateTime.now - 30
            where("created_at >= ?", recent_date)
        }
    end
  end