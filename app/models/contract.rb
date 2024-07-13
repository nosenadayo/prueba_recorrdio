class Contract < ApplicationRecord
  has_many :daily_contracts
  has_many :time_blocks, through: :daily_contracts
  has_many :assignments, through: :time_blocks
  has_many :users, through: :assignments

  accepts_nested_attributes_for :daily_contracts
end
