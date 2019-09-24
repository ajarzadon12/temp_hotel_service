# coding: utf-8
class HotelDataController < ApplicationController
  # params sample:
  # {
  #   "destination"=>["(RAK) Marrakech"],
  #   "start_date"=>"2019-10-21",
  #   "end_date"=>"2019-10-27",
  #   "room_type"=>"2 Room, 4 Adult, 2 Child"
  # }
  def hotel_search
    render json: { hotels: [
      {
        hotelId: 1,
        hotelName: "1 Monasterio de San Francisco",
        hotelChain: 'One Hotels',
        isRecommended: true,
        starRating: 1,
        reviewScore: (1 * 1.9).round(1),
        price: 1000,
        distance: 1,
        nearbyPlaces: [
          { distance: 30.0, name: 'Castillo de Almodovar del Río' },
          { distance: 38.0, name: 'Jardines de Moratalla' },
          { distance: 33.0, name: 'Palacio de Portocarrero' },
          { distance: 38.0, name: 'Écija' },
          { distance: 32.0, name: 'Parque Natural de Hornachuelos' },
        ],
        offers: ['Free Breakfast'],
        facilities: ['Internet access'],
        styles: ['Beach'],
        propertyType: 'Bread and Breakfast',
        provider: 'hotelbeds',
      },
      {
        hotelId: 2,
        hotelName: "2 Monasterio de San Francisco",
        hotelChain: 'Two Hotels',
        isRecommended: false,
        starRating: 2,
        reviewScore: (2 * 1.9).round(1),
        price: 2000,
        distance: 2,
        nearbyPlaces: [
          { distance: 30.0, name: 'Castillo de Almodovar del Río' },
          { distance: 8.0, name: 'Jardines de Moratalla' },
          { distance: 3.0, name: 'Palacio de Portocarrero' },
          { distance: 28.0, name: 'Écija' },
          { distance: 12.0, name: 'Parque Natural de Hornachuelos' },
        ],
        offers: ['Free Parking'],
        facilities: ['Supermarket'],
        styles: ['Budget'],
        propertyType: 'Hostel',
        provider: 'totalstay',
      },
      {
        hotelId: 3,
        hotelName: "3 Monasterio de San Francisco",
        hotelChain: 'Three Hotels',
        isRecommended: true,
        starRating: 3,
        reviewScore: (3 * 1.9).round(1),
        price: 3000,
        distance: 3,
        nearbyPlaces: [
          { distance: 30.0, name: 'Castillo de Almodovar del Río' },
          { distance: 8.0, name: 'Jardines de Moratalla' },
          { distance: 3.0, name: 'Palacio de Portocarrero' },
          { distance: 28.0, name: 'Écija' },
          { distance: 12.0, name: 'Parque Natural de Hornachuelos' },
        ],
        offers: ['Exclusive Discount'],
        facilities: ['Minibar'],
        styles: ['Business'],
        propertyType: 'Bread and Breakfast',
        provider: 'hotelbeds',
      },
      {
        hotelId: 4,
        hotelName: "4 Monasterio de San Francisco",
        hotelChain: 'Four Hotels',
        isRecommended: true,
        starRating: 4,
        reviewScore: (4 * 1.9).round(1),
        price: 4000,
        distance: 4,
        nearbyPlaces: [
          { distance: 30.0, name: 'Castillo de Almodovar del Río' },
          { distance: 8.0, name: 'Jardines de Moratalla' },
          { distance: 3.0, name: 'Palacio de Portocarrero' },
          { distance: 28.0, name: 'Écija' },
          { distance: 12.0, name: 'Parque Natural de Hornachuelos' },
        ],
        offers: ['Free Cancellation'],
        facilities: ['Set menu dinner'],
        styles: ['Family'],
        propertyType: 'Hostel',
        provider: 'totalstay',
      },
      {
        hotelId: 5,
        hotelName: "5 Monasterio de San Francisco",
        hotelChain: 'Five Hotels',
        isRecommended: false,
        starRating: 5,
        reviewScore: (5 * 1.9).round(1),
        price: 5000,
        distance: 5,
        nearbyPlaces: [
          { distance: 30.0, name: 'Castillo de Almodovar del Río' },
          { distance: 8.0, name: 'Jardines de Moratalla' },
          { distance: 3.0, name: 'Palacio de Portocarrero' },
          { distance: 28.0, name: 'Écija' },
          { distance: 12.0, name: 'Parque Natural de Hornachuelos' },
        ],
        offers: ['Last Minute Discount'],
        facilities: ['Entertainment Area'],
        styles: ['Luxury'],
        propertyType: 'Bread and Breakfast',
        provider: 'hotelbeds',
      },
    ]
    }, status: :ok
  end

  # renders hotel basic info - find by id
  def hotel_details
    facilities = [
      { description: 'Parking' },
      { description: 'Pet Friendly' },
      { description: 'Pool' },
      { description: 'Restaurant' },
      { description: 'Spa' }
    ]
    facility = case params[:hotel_id].to_i
               when 1 then { description: 'Internet access' }
               when 2 then { description: 'Supermarket' }
               when 3 then { description: 'Minibar' }
               when 4 then { description: 'Set menu dinner' }
               when 5 then { description: 'Entertainment Area' }
               end
    facilities = facilities.unshift(facility)
    render json: {
      hotelId: params[:hotel_id],
      name: "#{params[:hotel_id]} Monasterio de San Francisco",
      provider: (params[:hotel_id].to_i % 2 == 0) ? 'totalstay' : 'hotelbeds',
      description: "This hotel is situated in Palma del Rio, just 1 km away from the resort centre. Cordoba is just 54 km away. Many boutiques, cafes, bars, restaurants and nightclubs can be found close by. Links to the public transport network can be found just a short walking distance away. Seville Airport is 70 km away. This hotel is set amidst 2000 metres squared of gardens, around a 17th-century courtyard. The guest rooms come well equipped with modern amenities, for visitors' convenience. The hotel features a conference room, for business travellers. Guests will appreciate the delectable dining experience that the hotel's restaurant has to offer. Guests can sit back and unwind with a refreshing drink from the bar.",
      starRating: params[:hotel_id],
      city: 'Palma Del Rio',
      country: 'Spain',
      reviewsAve: (params[:hotel_id].to_i * 1.9).round(1),
      reviewsCount: '12,345',
      images: {
        image_urls: [
          {
            url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ba_001.jpg',
            filename: '000122a_hb_ba_001.jpg',
          },
          {
            url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_a_009.jpg',
            filename: '000122a_hb_a_009.jpg',
          },
          {
            url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ro_008.jpg',
            filename: '000122a_hb_ro_008.jpg',
          },
          {
            url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ro_004.jpg',
            filename: '000122a_hb_ro_004.jpg',
          },
          {
            url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ro_008.jpg',
            filename: '000122a_hb_ro_008.jpg',
          },
        ]
      },
      facilities: facilities,
      # how to present the base room info? (desciption, type_description, price) - from first entry of the hotel search
      room: {
        description: 'Twin Standard',
        characteristic: (params[:hotel_id].to_i % 2 == 0) ? 'Hostel' : 'Bread and Breakfast',
        price: "Php #{params[:hotel_id].to_i * 1000}",
      }
    }, status: :ok
  end

  # renders hotel location info - find by id
  def hotel_location
    render json: {
      hotelId: params[:hotel_id],
      address: {
        street_address: 'AVENIDA PIO XII,35',
        latitude: '37.69408',
        longitude: '-5.280594',
        city: 'Palma Del Rio',
        country: 'Spain',
      },
      terminals: [
        {
          distance: '0.1',
          name: 'CORDOBA',
        },
        {
          distance: '0.1',
          name: 'Seville, Seville San Pablo Airport',
        },
        {
          distance: '0.2',
          name: 'Málaga, Málaga Costa del Sol Airport',
        },
      ],
      interestPoints: [
        {
          distance: '30.0',
          poi_name: 'Castillo de Almodovar del Río',
        },
        {
          distance: '8.0',
          poi_name: 'Jardines de Moratalla',
        },
        {
          distance: '3.0',
          poi_name: 'Palacio de Portocarrero',
        },
        {
          distance: '28.0',
          poi_name: 'Écija',
        },
        {
          distance: '12.0',
          poi_name: 'Parque Natural de Hornachuelos',
        },
      ],
    }, status: :ok
  end

  # renders hotel reviews - find by id
  def hotel_reviews
    render json: {
      hotelId: params[:hotel_id],
      reviews: {
        aveRating: '7.8',
        totalCount: '12,345',
        ratingPerCategory: {
          Value: '8.1',
          Rooms: '7.3',
          Cleanliness: '8.0',
          Service: '7.5',
        },
        reviews: [
          {
            rating: '9.0',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            date: 'July 2019',
            name: 'Alvin',
          },
          {
            rating: '7.8',
            description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            date: 'June 2019',
            name: 'Joseph',
          },
          {
            rating: '8.1',
            description: 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            date: 'May 2019',
            name: 'Alvin Joseph',
          },
          {
            rating: '9.2',
            description: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
            date: 'June 2019',
            name: 'AJ',
          },
          {
            rating: '8.8',
            description: 'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
            date: 'May 2019',
            name: 'Josef',
          },
          {
            rating: '8.4',
            description: 'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
            date: 'August 2019',
            name: 'Alfyn',
          },
        ],
      },
    }, status: :ok
  end

  # renders hotel reviews - find by id
  def hotel_rooms
    render json: {
      hotelId: params[:hotel_id],
      rateCombinations: [
        [
          {
            room: {
              description: 'Twin Standard',
              characteristic: 'Standard',
              typeDescription: 'Villa',
              facilities: [
                { description: 'Internet access' },
                { description: 'Supermarket' },
                { description: 'Minibar' },
                { description: 'Set menu dinner' },
                { description: 'Entertainment Area' },
              ],
              images: {
                image_urls: [
                  {
                    url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ba_001.jpg',
                    filename: '000122a_hb_ba_001.jpg',
                  },
                  {
                    url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ro_004.jpg',
                    filename: '000122a_hb_ro_004.jpg',
                  },
                  {
                    url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ro_008.jpg',
                    filename: '000122a_hb_ro_008.jpg',
                  },
                ]
              },
            },
            sellingPrice: 'Php 5,670',
            cancellationPolicies: ['Free cancellation', 'Non-refundable'],
            totalGuests: 2,
          },
          {
            room: {
              description: 'Twin Standard',
              characteristic: 'Standard',
              typeDescription: 'Apartment',
              facilities: [
                { description: 'Internet access' },
                { description: 'Supermarket' },
                { description: 'Minibar' },
                { description: 'Set menu dinner' },
                { description: 'Entertainment Area' },
              ],
              images: {
                image_urls: [
                  {
                    url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ba_001.jpg',
                    filename: '000122a_hb_ba_001.jpg',
                  },
                  {
                    url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ro_008.jpg',
                    filename: '000122a_hb_ro_008.jpg',
                  },
                  {
                    url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ro_004.jpg',
                    filename: '000122a_hb_ro_004.jpg',
                  },
                  {
                    url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ro_008.jpg',
                    filename: '000122a_hb_ro_008.jpg',
                  },
                ]
              },
            },
            sellingPrice: 'Php 7,890',
            cancellationPolicies: ['Free cancellation'],
            totalGuests: 2,
          },
        ],
        [
          {
            room: {
              description: 'Twin Standard',
              characteristic: 'Standard',
              typeDescription: 'Villa',
              facilities: [
                { description: 'Internet access' },
                { description: 'Supermarket' },
                { description: 'Minibar' },
                { description: 'Set menu dinner' },
                { description: 'Entertainment Area' },
              ],
              images: {
                image_urls: [
                  {
                    url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ba_001.jpg',
                    filename: '000122a_hb_ba_001.jpg',
                  },
                  {
                    url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_a_009.jpg',
                    filename: '000122a_hb_a_009.jpg',
                  },
                  {
                    url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ro_008.jpg',
                    filename: '000122a_hb_ro_008.jpg',
                  },
                  {
                    url: 'http://photos.hotelbeds.com/giata/00/000122/000122a_hb_ro_008.jpg',
                    filename: '000122a_hb_ro_008.jpg',
                  },
                ]
              },
            },
            sellingPrice: 'Php 4,560',
            cancellationPolicies: ['Free cancellation', 'Non-refundable'],
            totalGuests: 1,
          },
        ],
      ],
    }, status: :ok
  end
end
