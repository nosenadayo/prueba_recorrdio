class AssignmentFacade
  attr_accessor :params

  def initialize(**options)
    @params = options[:params]
  end

  def assignment_by_user
    @assignment_by_user ||= Assignment.assignment_by_user(
      user_id: params[:user_id],
      date: params[:date],
      time_block_id: params[:time_block_id],
      daily_contract_id: params[:daily_contract_id],
      contract_id: params[:contract_id]
    ).size
  end

  def assignment_by_date
    @assignment_by_date = Assignment.assignment_by_date(
      date: params[:date],
      time_block_id: params[:time_block_id],
      daily_contract_id: params[:daily_contract_id],
      contract_id: params[:contract_id]
    )
  end
end
