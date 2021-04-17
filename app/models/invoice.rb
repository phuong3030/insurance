class Invoice < ApplicationRecord
  include Uneditable
  include Undestroyable

  belongs_to :contract
end
