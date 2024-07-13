class TimeBlock < ApplicationRecord
  belongs_to :daily_contract
  has_many :assignments

  delegate :contract, to: :daily_contract
end
