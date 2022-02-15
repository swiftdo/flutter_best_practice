const k_rssCateAllId = -1; // 全部的id

class RssCategory {
  final int id;
  final String name;

  bool get isAll => id == k_rssCateAllId;
  bool get isNone => id == 0;

  RssCategory.all()
      : id = k_rssCateAllId,
        name = "全部";

  RssCategory.none()
      : id = 0,
        name = "未分类";

  RssCategory({required this.id, required this.name});
}
