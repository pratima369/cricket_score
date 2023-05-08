class searchList {
  searchList({
    required this.apikey,
    required this.data,
    required this.status,
    required this.info,
  });
  late final String apikey;
  late final List<Data> data;
  late final String status;
  late final Info info;

  searchList.fromJson(Map<String, dynamic> json){
    apikey = json['apikey'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    status = json['status'];
    info = Info.fromJson(json['info']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['apikey'] = apikey;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['status'] = status;
    _data['info'] = info.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.country,
  });
  late final String id;
  late final String name;
  late final String country;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['country'] = country;
    return _data;
  }
}

class Info {
  Info({
    required this.hitsToday,
    required this.hitsUsed,
    required this.hitsLimit,
    required this.credits,
    required this.server,
    required this.offsetRows,
    required this.totalRows,
    required this.queryTime,
    required this.s,
    required this.cache,
  });
  late final int hitsToday;
  late final int hitsUsed;
  late final int hitsLimit;
  late final int credits;
  late final int server;
  late final int offsetRows;
  late final int totalRows;
  late final double queryTime;
  late final int s;
  late final int cache;

  Info.fromJson(Map<String, dynamic> json){
    hitsToday = json['hitsToday'];
    hitsUsed = json['hitsUsed'];
    hitsLimit = json['hitsLimit'];
    credits = json['credits'];
    server = json['server'];
    offsetRows = json['offsetRows'];
    totalRows = json['totalRows'];
    queryTime = json['queryTime'];
    s = json['s'];
    cache = json['cache'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['hitsToday'] = hitsToday;
    _data['hitsUsed'] = hitsUsed;
    _data['hitsLimit'] = hitsLimit;
    _data['credits'] = credits;
    _data['server'] = server;
    _data['offsetRows'] = offsetRows;
    _data['totalRows'] = totalRows;
    _data['queryTime'] = queryTime;
    _data['s'] = s;
    _data['cache'] = cache;
    return _data;
  }
}