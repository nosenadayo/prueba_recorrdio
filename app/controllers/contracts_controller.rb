class ContractsController < ApplicationController

  def index
    facade = ContractFacade.new
    render json: {
      data: facade.index
    }
  end

  def count_assignment_by_week
    facade = ContractFacade.new(params: params)

    render json:{
      count: facade.count_assignment_by_week
    }
  end

  def count_unassigned
    facade = ContractFacade.new(params: params)

    render json:{
      count: facade.count_unassigned
    }
  end
end
