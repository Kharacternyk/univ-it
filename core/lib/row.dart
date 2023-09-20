class Row {
  final List<Object> cells;

  const Row(this.cells);

  @override
  operator ==(other) {
    if (other case Row other) {
      if (cells.length != other.cells.length) {
        return false;
      }

      for (var i = 0; i < cells.length; ++i) {
        if (cells[i] != other.cells[i]) {
          return false;
        }
      }

      return true;
    }

    return false;
  }

  @override
  int get hashCode => Object.hashAll(cells);
}
