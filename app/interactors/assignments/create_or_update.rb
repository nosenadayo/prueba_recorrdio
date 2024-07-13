module Assignments
  class CreateOrUpdate
    include Interactor

    before do
      user
      time_block
    end

    def call
      Assignment.transaction do
        context.assignment = Assignment.confirmed_or_assigned
                                       .find_or_create_by(
          user_id: context.user.id,
          time_block_id: context.time_block.id,
          date: date
        )

        apply_cancelled
      end
    end

    private

    def user
      context.user = User.find(context.params[:assignment][:user_id])
    end

    def time_block
      context.time_block = TimeBlock.find(context.params[:assignment][:time_block_id])
    end

    def date
      @date = context.params[:assignment][:date]
    end

    def exist_cancelled?
      context.user.assignments
             .where(time_block_id: context.time_block.id)
             .cancelled
             .any?
    end

    def apply_cancelled
      assigned = context.params[:assignment][:assigned]
      raise 'no se permite volver a cancelar esta asignacion' if assigned.eql?(false) && exist_cancelled?

      context.assignment.cancelled! if assigned.eql?(false)
    end
  end
end
