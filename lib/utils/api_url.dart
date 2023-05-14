class ApiURL {

  static String TOP_HEADLINES = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=df077fdbfc1c47cd82fa177fd9d96a4d';

  static String headlinesFor(String keyword) => 'https://newsapi.org/v2/everything?q=$keyword&apiKey=df077fdbfc1c47cd82fa177fd9d96a4d';
}