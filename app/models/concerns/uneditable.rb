module Uneditable
  extend ActiveSupport::Concern

  included do
    before_update -> { raise ActiveRecord::ReadOnlyRecord }
  end
end
