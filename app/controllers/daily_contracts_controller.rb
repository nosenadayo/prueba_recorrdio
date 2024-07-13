class DailyContractsController < ApplicationController
  def index
    contract = Contract.find(params[:contract_id])

    render json:{
      data: DailyContractDecorator.decorate_collection(contract.daily_contracts)
    }
  end
end
