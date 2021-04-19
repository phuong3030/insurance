module Undestroyable
  extend ActiveSupport::Concern

  included do
    before_destroy -> { raise ActiveRecord::RecordNotDestroyed }
  end
end
