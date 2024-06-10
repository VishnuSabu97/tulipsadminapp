class Category{
  String ?id;
  String catname;
  String url;

  Category({this.id, required this.catname, required this.url});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'catname': catname,
      'url': url};}

}
class ServiceModel{
  String ?id;
  late String url;
  late String name;
  late String discription;
  late String category;
  late String price;
  late String discountpersent;
  late String discountprice;
  late String idealfor;
  late String Duration;

  ServiceModel({
      this.id,
      required this.url,
    required this.name,
    required this.discription,
    required this.category,
    required  this.price,
    required  this.discountpersent,
    required  this.discountprice,
    required  this.idealfor,
    required  this.Duration});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'price': price,
      'discription': discription,
      'category': category,
      'discountpersent': discountpersent,
      'idealfor': idealfor,
      'discountprice': discountprice,
      'Duration': Duration
    };}
}