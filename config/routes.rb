Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hotel_search' => 'hotel_data#hotel_search'
  get '/hotel_details' => 'hotel_data#hotel_details'
  get '/hotel_location' => 'hotel_data#hotel_location'
  get '/hotel_reviews' => 'hotel_data#hotel_reviews'
  get '/hotel_rooms' => 'hotel_data#hotel_rooms'
end
