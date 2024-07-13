class TimeBlocksController < ApplicationController
  def index
    time_blocks = TimeBlock.joins(:daily_contract)
                           .where(daily_contract: {
                             id: params[:daily_contract_id],
                             contract_id: params[:contract_id]
                           })
                           .order(:hour)
                           .distinct(:id)
                           .decorate

    render json: time_blocks, each_serializer: TimeBlockSerializer, root: false
  end
end
