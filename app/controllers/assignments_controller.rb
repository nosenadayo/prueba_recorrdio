class AssignmentsController < ApplicationController

  def assignment_by_user
    facade = AssignmentFacade.new(params: params)

    render json:{
      data: { assigned: facade.assignment_by_user }
    }
  end

  def assignment_by_date
    facade = AssignmentFacade.new(params: params)

    render json: facade.assignment_by_date,
           each_serializer: AssignmentSerializer,
           root: false
  end
  def create
    service = Assignments::PlaceAssignOrganize.call(params: params)

    render json:  service.assignment , status: :created
  end
end
