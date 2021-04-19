class InvoiceItem < ApplicationRecord
  include Uneditable
  include Undestroyable

  belongs_to :property
  belongs_to :invoice
end
