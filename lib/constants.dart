// API service

const String baseURL = 'api.github.com';
const String pathURL = 'search/repositories';
const int searchResultsOutput = 15;
const Map<String, String> headers = {
  'Accept': 'application/vnd.github+json',
  'Authorization': 'Bearer myToken',
};

// TEXTS

/// LoadingScreen

/// SearchScreen
String navigationBarSearchScreen = 'Github repos list';
String searchHistory = 'Search History';
String emptyHistory =
    'You have empty history. \nClick on search to start journey!';
String emptySearchResultHeader = 'What we found';
String emptySearchResultBody =
    'Nothing was found for your search. \nPlease check the spelling';
String searchResultHeader = 'What we have found';
const String hintText = 'Search';

///FavoriteScreen

const String navigationBarFavoriteScreen = 'Favorite repos list';
const String favoriteScreenEmptyBody =
    'You have no favorites. \nClick on star while searching to add first favorite';
