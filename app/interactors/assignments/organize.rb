module Assignments
  class Organize
    include Interactor

    def call
      assignment = context.assignment
      assignments = assignment.time_block
                      &.assignments
                      &.confirmed_or_assigned
                      &.where(date: assignment.date)

      if assignments&.count.eql?(1)
        assignment.assigned!
      else
        users = assignments&.distinct&.map(&:user)
        users_with_count = users&.map do |user|
          [user, user.assignments.assigned.count]
        end
        min_user_with_count = users_with_count&.min_by { |_user, count| count }
        assignments&.update(status: :confirmed)
        min_user_with_count&.first
          &.assignments
          &.where(date: assignment.date)
          &.where(time_block: assignment.time_block)
          &.update(status: :assigned)
      end
    end
  end
end
