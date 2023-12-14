class kategoriWisata {
  final String imageUrl;
  final String name;

  kategoriWisata({required this.imageUrl, required this.name});
}

final List<kategoriWisata> journey = [
  kategoriWisata(
    //Kategori ke-1
    imageUrl:
        "https://thumb.tvonenews.com/thumbnail/2022/06/06/629d62423bd0f-candi-borobudur-magelang-jawa-tengah_1265_711.jpg",
    name: "Heritage",
  ),
  kategoriWisata(
    //Kategori ke-2
    imageUrl:
        "https://img.okezone.com/content/2019/03/28/337/2036019/ada-127-gunung-api-aktif-di-indonesia-bagaimana-tingkat-aktivitasnya-sekarang-v4sc6FKC4n.jfif",
    name: "Mountain",
  ),
  kategoriWisata(
    //Kategori ke-3
    imageUrl:
        "https://cdn.idntimes.com/content-images/post/20180501/pulau-derawan-1-8f04c3807025b2800e2c832663e7fe41_600x400.jpg",
    name: "Beach",
  ),
  kategoriWisata(
    //Kategori ke-4
    imageUrl:
        "https://cdn.idntimes.com/content-images/post/20180612/67f7823542209beb4780df7cf17c98d1_600x400.jpg",
    name: "Religious",
  ),
  kategoriWisata(
    //Kategori ke-5
    imageUrl:
        "https://cdnaz.cekaja.com/media/2020/09/1870_Artikel-CA20_-Julukan-Kota-di-Indonesia.jpg",
    name: "City",
  ),
];
