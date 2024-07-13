Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :contracts, only: %i[index count_assignment_by_week count_unassigned] do
    get 'count_assignment_by_week', to: 'contracts#count_assignment_by_week', on: :member
    get 'count_unassigned', to: 'contracts#count_unassigned', on: :member
    resources :daily_contracts, only: %i[index]  do
      resources :time_blocks, only: %i[index] do
        resources :assignments, only: %i[create assignment_by_user assignment_by_date] do
          get :assignment_by_user, to: 'assignments#assignment_by_user', on: :collection
          get :assignment_by_date, to: 'assignments#assignment_by_date', on: :collection
        end
      end
    end
  end

  resources :users, only: %i[index]
end
