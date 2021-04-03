class UserModel {
  final String name, urlImage, location, bio;
  final int countFollowers, countFollowing, countPosts;
  final List<String> urlPhotos;
   bool isFollowing;

  UserModel(
      {this.name,
      this.urlImage,
      this.location,
      this.bio,
      this.countFollowers,
      this.countFollowing,
      this.countPosts,
      this.urlPhotos,
      this.isFollowing});
}

final users = <UserModel>[
  UserModel(
    name: 'Bill Gates',
    bio:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mauris massa, aliquet eu nisl non, lacinia tristique odio. Sed fringilla sagittis ante, sed rutrum sem elementum vitae. Sed auctor massa at lacinia sollicitudin.',
    countFollowers: 140,
    countFollowing: 100,
    countPosts: 35,
    isFollowing: true,
    location: 'United State',
    urlImage:
        'https://storage.googleapis.com/cgiarorg/2021/02/c343f97f-1200x-1-b.jpg',
    urlPhotos: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPsnOjwirofUPFy2IfmOv1ATNO3Vqd1uCi2g&usqp=CAU',
      'https://ep01.epimg.net/estaticos/arc/2021/02/entrevista/img/bill.jpg',
      'https://s3.amazonaws.com/talkstar-photos/uploads/5cd9cb00-9df3-4da0-b857-c31eb159ccda/BillGates_2010-embed.jpg'
    ],
  ),
  UserModel(
    name: 'Steve jobs',
    bio:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mauris massa, aliquet eu nisl non, lacinia tristique odio. ',
    countFollowers: 120,
    countFollowing: 20,
    countPosts: 118,
    isFollowing: false,
    location: 'United State',
    urlImage:
        'https://assets.entrepreneur.com/content/3x2/2000/1608242008-Dic17SubastarnrarsimacartafirmadaporSteveJobsPORTADA.jpeg',
    urlPhotos: [
      'https://www.incimages.com/uploaded_files/image/1920x1080/getty_96211011_2000134813806405780_414357.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzMJYPynMN__urAm7voyaXbcgsqyb4Rv7HSFqfgxv4D0Bx_qw3QX9FLrjY9n8AyEzecf4&usqp=CAU',
      'https://media3.s-nbcnews.com/j/streams/2012/February/120220/56863-111102-jobs-book-1148a.nbcnews-fp-1200-630.jpg'
    ],
  ),
];
