abstract class BaseDataSource<T> {
  Future<T?> get(String id);
  Future<List<T>> getAll();
  Future<void> create(T entity);
  Future<void> update(T entity);
  Future<void> delete(String id);
}
