module Contracts
  class Create
    include Interactor

    def call
      contract = Contract.new(service_name:context.service_name)
      contract.daily_contracts << context.daily_contracts
      contract.save
      context.contract = contract
    end
  end
end
