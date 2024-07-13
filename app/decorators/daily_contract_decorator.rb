class DailyContractDecorator < Draper::Decorator
  delegate_all

  def start_time
    object.start_time.strftime('%H').to_i
  end

  def end_time
    object.end_time.strftime('%H').to_i
  end
end
