class Assigment < ApplicationRecord
  has_one :user
  belongs_to :time_block
end
