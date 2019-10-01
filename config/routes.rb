Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/v1/hotel_search' => 'hotel_data#hotel_search'
  get '/v1/hotel_details' => 'hotel_data#hotel_details'
  get '/v1/hotel_location' => 'hotel_data#hotel_location'
  get '/v1/hotel_reviews' => 'hotel_data#hotel_reviews'
  get '/v1/hotel_rooms' => 'hotel_data#hotel_rooms'
end
