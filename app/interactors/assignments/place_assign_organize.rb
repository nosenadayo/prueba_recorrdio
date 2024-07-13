module Assignments
  class PlaceAssignOrganize
    include Interactor::Organizer

    organize CreateOrUpdate,
             Organize
  end
end
