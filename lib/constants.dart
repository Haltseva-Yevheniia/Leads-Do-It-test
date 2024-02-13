

// API service

// String tokenGitHub = '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';
///String tokenGitHubNEW = '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';
const String baseURL = 'api.github.com';
const String pathURL = 'search/repositories';
const int searchResultsOutput = 15;
const Map<String, String> headers = {
  'Accept': 'application/vnd.github+json',
  'Authorization':
  'Bearer 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',
};


// TEXTS

/// LoadingScreen

/// SearchScreen
String navigationBarSearchScreen = 'Github repos list';
String searchHistory = 'Search History';
String emptyHistory = 'You have empty history. \nClick on search to start journey!';
String emptySearchResultHeader = 'What we found';
String emptySearchResultBody = 'Nothing was find for your search. \nPlease check the spelling';
String searchResultHeader = 'What we have found';
const String hintText = 'Search';

///FavoriteScreen

const String navigationBarFavoriteScreen= 'Favorite repos list';


