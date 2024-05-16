class homeItem{
  final String id;
  final String ImageUrl;
  final String exportCharge;
  var page;

  homeItem({
    required this.id,
    required this.ImageUrl,
    required this.exportCharge,
    required this.page,
  });
}



//to define that text will searching we make it emptry
//String text = "";

//define all item list
List<homeItem> HOME_ITEM_LIST = [
  homeItem(
      id: "developer",
      ImageUrl: 'https://p0.piqsels.com/preview/373/506/571/5be94655e1983.jpg',
      exportCharge: '5k INR/MONTH',
      page: null),

  homeItem(
      id: "founder",
      ImageUrl: 'https://img.freepik.com/free-photo/make-money-online-angelic-rich-businessman-with-nimbus-head-pointing-dollar-banknotes-encouraging-earn-internet-sitting-laptop-workplace-indoor-studio-shot-isolated-white-background_231208-3660.jpg',
      exportCharge: '2.5k INR/MONTH',
      page: null),
  homeItem(
      id: "cofounder",
      ImageUrl: 'https://d3nwecxvwq3b5n.cloudfront.net/AcuCustom/Sitename/DAM/020/iStock-1017296544.jpg',
      exportCharge: '3k INR/MONTH',
      page: null),

];
