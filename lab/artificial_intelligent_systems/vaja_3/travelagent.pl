:- include('travel_agent.pl').

% Suggest cities based on transport and budget preferences
suggest_city :-
    write('What type of transport do you prefer? (plane/other): '),
    read(Transport),
    write('Do you want to travel on a low budget? (yes/no): '),
    read(BudgetResponse),
    (BudgetResponse = yes -> Budget = low ; Budget = high),
    find_city(Transport, Budget).

find_city(Transport, Budget) :-
    transport(City, Transport),
    cost(City, Budget),
    write(City), nl,
    fail. % Ensures all cities matching the criteria are printed
find_city(_, _) :- !.

% Suggest landmarks for a city with a travel guide
suggest_landmark :-
    write('Enter the name of the city you are interested in: '),
    read(City),
    write('How many landmarks are you looking for? (1-5): '),
    read(N),
    findnsols(N, Landmark, landmark(City, Landmark), Landmarks),
    write('Top landmarks: '), write(Landmarks), nl,
    travel_guide(City, Book, Author),
    write('Recommended travel guide: '), write(Book), write(' by '), write(Author), nl.

% Suggest restaurants based on cuisine, price range, and rating
suggest_restaurant :-
    write('Enter the name of the city: '),
    read(City),
    write('What type of cuisine do you prefer? '),
    read(Cuisine),
    write('What is the maximum price range you are willing to pay? (1=$, 2=$$, 3=$$$): '),
    read(MaxPrice),
    write('What is the minimum average rating you require? (e.g., 4.5): '),
    read(MinRating),
    find_restaurant(City, Cuisine, MaxPrice, MinRating).

find_restaurant(City, Cuisine, MaxPrice, MinRating) :-
    restaurant(City, Restaurant),
    price_range(Restaurant, Price),
    Price =< MaxPrice,
    rating(Restaurant, Rating),
    Rating >= MinRating,
    cuisine(Restaurant, Cuisine),
    write(Restaurant), nl,
    fail. % Ensures all matching restaurants are printed
find_restaurant(_, _, _, _) :- !.


