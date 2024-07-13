class TimeBlockDecorator < Draper::Decorator
  delegate_all
  def hour
    object.hour.strftime('%H:%M')
  end
end
