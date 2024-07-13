class Assignment < ApplicationRecord

  enum status: {
    confirmed: 0,
    assigned: 1,
    cancelled: 2,
  }

  belongs_to :user
  belongs_to :time_block

  scope :confirmed_or_assigned, -> { confirmed.or(assigned)}

  def self.joins_contract(**query)
    joins(time_block: {daily_contract: :contract})
    .where(
      date: query[:date],
      time_blocks: {
        id: query[:time_block_id],
        daily_contracts: {
          id: query[:daily_contract_id],
          contracts: {
            id: query[:contract_id]
          }
        }
      })
  end

  def self.assignment_by_user(**query)
    confirmed_or_assigned
      .joins_contract(query)
      .where(user_id: query[:user_id])
  end

  def self.assignment_by_date(**query)
    assigned
      .joins_contract(query)
  end
end
