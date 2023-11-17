
class CategoryDM{
  int id;
  String title;
  String image;

  CategoryDM({required this.id, required this.title, required this.image,});

  static List<CategoryDM> getCategories(){
    return [
      CategoryDM(id: 28, title: "Action", image: 'assets/images/action 1.png'),
      CategoryDM(id: 12, title: "Adventure", image: 'assets/images/adventure 1.png'),
      CategoryDM(id: 16, title: "Animation", image: 'assets/images/animation 1.png'),
      CategoryDM(id: 35, title: "Comedy", image: 'assets/images/comedy 1.png'),
      CategoryDM(id: 80, title: "Crime", image: 'assets/images/crime 1.png'),
      CategoryDM(id: 99, title: "Documentary", image: 'assets/images/documentary 1.png'),
      CategoryDM(id: 18, title: "Drama", image: 'assets/images/drama 1.png'),
      CategoryDM(id: 10751, title: "Family", image: 'assets/images/family 1.png'),
      CategoryDM(id: 14, title:"Fantasy", image: 'assets/images/fantasy 1.png'),
      CategoryDM(id: 36, title: "History", image: 'assets/images/history 1.png'),
      CategoryDM(id: 27, title: "Horror", image: 'assets/images/horror 1.png'),
      CategoryDM(id: 10402, title: "Music", image: 'assets/images/music 1.png'),
      CategoryDM(id: 9648, title: "Mystery", image: 'assets/images/mystery 1.png'),
      CategoryDM(id: 10749, title: "Romance", image: 'assets/images/romance 1.png'),
      CategoryDM(id: 878, title:"Science Fiction", image: 'assets/images/science fiction 1.png'),
      CategoryDM(id: 10770, title: "TV Movie", image: 'assets/images/tvmovies 1.png'),
      CategoryDM(id: 53, title:"Thriller", image: 'assets/images/thriller 3.png'),
      CategoryDM(id: 10752, title: "War", image: 'assets/images/war 2.png'),
      CategoryDM(id: 37, title: "Western", image: 'assets/images/western 1.png'),
    ];
  }
}
