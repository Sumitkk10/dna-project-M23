# Final Project : Phase 4
**Team Members**: 

### Functional Requirements Commands for Python CLI

#### Insert
1. **Adding New Song/Album Data**
   - Function: `add_album_data()`
   - Description: Adds new album data including songs, collaborations, and teasers.

2. **Tour Schedule with Date Validity**
   - Function: `add_tour_dates()`
   - Description: Adds tour dates to the database and checks for date overlaps.

#### Update
1. **Chart Position Updates**
   - Function: `update_chart_position(album_name, new_chart_position)`
   - Description: Updates chart positions for albums.

2. **Marketing Campaign Reallocation**
   - Function: `assign_budget_to_campaign(user_budget)`
   - Description: Reallocates campaign budgets based on album performance.

#### Delete
1. **Managing Artist Transitions: Deleting Departing Artists**
   - Function: `delete_artist(artist_id)`
   - Description: Removes artist records when they leave the label.

2. **Employee Deletion**
   - Function: `delete_employee(employee_id)`
   - Description: Deletes employee records for departed individuals.

#### Selection
1. **Recent Album Releases by Artists**
   - Function: `artists_released_past_year()`
   - Description: Retrieves artists who released albums in the past year.

#### Projection
1. **Searching by Genre**
   - Function: `get_album_names_by_genre(genre)`
   - Description: Retrieves album names by a specific genre.

2. **Searching tours in a certain Location**
   - Function: `get_tours_by_location(city, state)`
   - Description: Retrieves tours planned in a specific location.

#### Aggregate
1. **Exploring Album Prolificacy**
   - Function: `total_released_albums()`
   - Description: Calculates the total count of released albums.

2. **Spotlighting the Minimalist Artist**
   - Function: `artist_with_min_albums()`
   - Description: Finds the artist with the least number of albums released.

#### Search
1. **Artist Name Lookup**
   - Function: `check_artist_name(user_input)`
   - Description: Searches for an artist name in the database.

### Additional Functional Requirements (Commands)

1. **Get High Grossing Collaboration**
   - Function: `get_high_grossing_collaboration()`
   - Description: Finds the highest grossing album's artist and associated producer.

2. **Average Chart Position**
   - Function: `average_chart_position()`
   - Description: Calculates the average chart position per artist.