<html>
<head>
  <title></title>
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=INSERT_YOUR_OWN_API_KEY&sensor=false&libraries=places"></script>

  <script src="./script.js"></script>
  <link href="./style.css" rel="stylesheet">
</head>
<body>

  <nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">

      <a class="navbar-brand" href="#">Gmaps</a>
    </div>
  </nav>
  <hr />

  <div class="row">
    <div class="col-md-4">
      <h3>AUTOCOMPLETE</h3>
      <form class="row" role="search" id="places_form">
        <div class="form-group col-md-12">
          <input type="text" id="autocomplete" class="form-control " placeholder="Search">
        </div>
      </form>
    </div>
    <div class="col-md-4">
      <h3>DIRECTIONS</h3>
      <form class="navbar-left" role="search" id="directions_form" class="row">
        <div class="form-group col-md-4">
          <input type="text" class="form-control " id="directions_from" placeholder="From">
        </div>
        <div class="form-group col-md-4">
          <input type="text" class="form-control col-md-2" id="directions_to" placeholder="To">
        </div>
        <div class="form-group col-md-4">
          <select id="directions_mode">
            <option value="DRIVING">Driving</option>
            <option value="WALKING">Walking</option>
            <option value="BICYCLING">Bike</option>
            <option selected value="TRANSIT">Public transport</option>
          </select>

        </div>
        <div class="form-group col-md-4">
          <button type="submit" class="btn btn-default">Submit</button>
        </div>
      </form>
    </div>
    <div class="col-md-4">
      <h3>GEOLOCATION</h3>
      <button class="btn btn-default" id="current_position">Show my position</button>
    </div>
  </div>

  <hr />

  <div class="row">
    <div id="map-container" class="col-md-6">
      <div id="googleMap"></div>
    </div>
    <div id="directions-container" class="col-md-6">
      <div id="directions-panel"></div>
    </div>
  </div>
  </body>
</html>


<!-- locations/show.html.erb -->

<%= image_tag "http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=16&markers=#{@location.latitude}%2C#{@location.longitude}" %>
<h3>Nearby locations</h3>
<ul>
<% for location in @location.nearbys(10) %>
  <li><%= link_to location.address, location %> (<%= location.distance.round(2) %> miles)</li>
<% end %>
</ul>


<!-- locations/index.html.erb -->

<%= form_tag locations_path, :method => :get do %>
  <p>
    <%= text_field_tag :search, params[:search] %>
    <%= submit_tag "Search Near", :name => nil %>
  </p>
<% end %>
