module TimeBlocks
  class Build
    include Interactor
    def call
      apply_build
    end

    private
    def apply_build
      daily_contracts = context.contract.daily_contracts
      daily_contracts.each do |daily_contract|
        range_date = daily_contract.start_time.to_i..daily_contract.end_time.to_i
        range_date.step(1.hour).each do |hour|
          daily_contract.time_blocks
                        .create(hour: Time.at(hour))
        end
      end
    end
  end
end
