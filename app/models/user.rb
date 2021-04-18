class User < ApplicationRecord
  has_many :contracts, :dependent => :destroy
end
