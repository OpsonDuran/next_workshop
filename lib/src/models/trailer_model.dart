class TrailerModel{
  int _id;
  List<_Result> _results =[];

  TrailerModel.fromJson(Map<String ,dynamic> parsedJson){
    _id= parsedJson['id'];
    List<_Result> temp =[];
    for(int i = 0; i< parsedJson['results'].length;i++){
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }
  List<_Result> get results => _results;
  int get id =>_id;
}

class _Result {
  String _id;
  String _iso_639_1;
  String _iso_3166_1;
  String _key;
  String _name;
  String _site;
  int _size;
  String _type;

  _Result(result){
    this._id = result['id'];
    this._iso_639_1 = result['iso_639_1'];
    this._iso_3166_1 = result['iso_3166_1'];
    this._key = result['key'];
    this._name = result['name'];
    this._site = result['site'];
    this._size = result['size'];
    this._type = result['type'];
  }

  String get id => _id;
  String get iso_639_1 => _iso_639_1;
  String get iso_3166_1 => _iso_3166_1;
  String get key => _key;
  String get name => _name;
  String get site => _site;
  int get size => _size;
  String get  type => _type;
}