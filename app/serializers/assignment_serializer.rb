class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :user, :status
  belongs_to :user
end
