class ContractFacade
  attr_accessor :params

  def initialize(**options)
    @params = options[:params]
  end

  def index
    @index ||= Contract.all
  end

  def count_assignment_by_week
    date = Date.parse(params[:date].to_s)
    start_date = date.beginning_of_week
    end_date = date.end_of_week
    contract = Contract.find(params[:id])
    @count_assignment_by_week ||= contract.assignments
                                .assigned
                                .where(user_id: params[:user_id])
                                .where(date: [start_date..end_date] )
                                .size
  end

  def count_unassigned
    date = Date.parse(params[:date].to_s)
    start_date = date.beginning_of_week
    end_date = date.end_of_week
    contract = Contract.find(params[:id])
    count_assignments = contract.assignments
                                .assigned
                                .where(date: [start_date..end_date] )
                                .size

    count_unassigned = (start_date..end_date).map do |datee|
      dailies = contract.daily_contracts
                        .where(day: datee.strftime('%A').downcase.to_sym,
                        contract: contract)
      dailies = dailies.map do |daily|
        daily.time_blocks.count
      end

      dailies.sum
    end

    @count_unassigned ||= count_unassigned.sum - count_assignments
  end
end
