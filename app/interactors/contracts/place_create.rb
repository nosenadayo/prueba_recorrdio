module Contracts
  class PlaceCreate
    include Interactor::Organizer

    organize Create,
             ::TimeBlocks::Build
  end
end
