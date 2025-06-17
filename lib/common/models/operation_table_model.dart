class ModelOfTableHeaders {
  final String columnName;
  final int flexFactor;

  const ModelOfTableHeaders(this.columnName, this.flexFactor);

  static List<ModelOfTableHeaders> getOperationTableHeaders() {
    return [
      const ModelOfTableHeaders("Материал", 2),
      const ModelOfTableHeaders("Приоритет", 2),
      const ModelOfTableHeaders("Статус", 2),
      const ModelOfTableHeaders("Дата ССЗ/Смена", 2),
      const ModelOfTableHeaders("Артикул", 2),
      const ModelOfTableHeaders("Хар-ка", 1),
      const ModelOfTableHeaders("Исполнитель", 2),
      const ModelOfTableHeaders("Детали план", 1),
      const ModelOfTableHeaders("Операция", 2),
      const ModelOfTableHeaders("Произв. операция", 2),
    ];
  }

  static List<ModelOfTableHeaders> getFinishedOperationTableHeaders() {
    return [
      const ModelOfTableHeaders("", 1),
      const ModelOfTableHeaders("Материал", 2),
      const ModelOfTableHeaders("Приоритет", 2),
      const ModelOfTableHeaders("Статус", 2),
      const ModelOfTableHeaders("Дата ССЗ/Смена", 2),
      const ModelOfTableHeaders("Артикул", 2),
      const ModelOfTableHeaders("Хар-ка", 1),
      const ModelOfTableHeaders("Исполнитель", 2),
      const ModelOfTableHeaders("Детали план", 1),
      const ModelOfTableHeaders("Операция", 2),
      const ModelOfTableHeaders("Произв. операция", 2),
    ];
  }

  static List<ModelOfTableHeaders> getProductionTableHeaders() {
    return [
      const ModelOfTableHeaders("Номенклатура", 2),
      const ModelOfTableHeaders("Характеристика", 2),
      const ModelOfTableHeaders("Упаковка", 2),
      const ModelOfTableHeaders("Количество", 2),
      const ModelOfTableHeaders("", 2)
    ];
  }

  static List<ModelOfTableHeaders>
      getProductionFinishedOperationTableHeaders() {
    return [
      const ModelOfTableHeaders("Обособл.", 1),
      const ModelOfTableHeaders("Номенклатура", 2),
      const ModelOfTableHeaders("Характеристика", 2),
      const ModelOfTableHeaders("Упаковка", 2),
      const ModelOfTableHeaders("Количество", 2),
      const ModelOfTableHeaders("", 2),
      const ModelOfTableHeaders("", 2),
    ];
  }

  static List<ModelOfTableHeaders> getMaterialTableHeaders() {
    return [
      const ModelOfTableHeaders("Номенклатура", 2),
      const ModelOfTableHeaders("Характеристика", 2),
      const ModelOfTableHeaders("Количество", 2),
      const ModelOfTableHeaders("Склад", 2),
      const ModelOfTableHeaders("Остаток", 2),
      const ModelOfTableHeaders("Упаковка", 2)
    ];
  }

  // ssz warehouse operations
  static List<ModelOfTableHeaders> getOrdersTableHeaders() {
    return const [
      //ModelOfTableHeaders("№", 1),
      ModelOfTableHeaders("Номер", 1),
      ModelOfTableHeaders("Дата", 1),
      ModelOfTableHeaders("Склад-отправитель", 1),
      ModelOfTableHeaders("Склад-получатель", 1),
      ModelOfTableHeaders("Приоритет", 1),
      ModelOfTableHeaders("Статус", 1),
      ModelOfTableHeaders("Комментарий", 1),
      ModelOfTableHeaders("Сопоставлено", 1),
    ];
  }

  static List<ModelOfTableHeaders> getSelectedOrderTableHeaders() {
    return const [
      ModelOfTableHeaders("Обособл.", 1),
      ModelOfTableHeaders("Номенклатура", 1),
      ModelOfTableHeaders("Хар-ка", 1),
      ModelOfTableHeaders("Дата отгр.", 1),
      ModelOfTableHeaders("Назнач.", 1),
      ModelOfTableHeaders("Статус", 1),
      ModelOfTableHeaders("Код АМТО", 1),
      ModelOfTableHeaders("Ед.", 1),
      ModelOfTableHeaders("Кол-во план.", 1),
      ModelOfTableHeaders("Кол-во факт.", 1),
      ModelOfTableHeaders("Выбрано", 1),
    ];
  }

  static List<ModelOfTableHeaders> getEquipmentTableHeaders() {
    return [
      const ModelOfTableHeaders("Номенклатура", 2),
      const ModelOfTableHeaders("Кол-во", 1),
      const ModelOfTableHeaders("Хар-ка", 1),
      const ModelOfTableHeaders("Назнач.", 2),
      const ModelOfTableHeaders("Отправитель", 1),
      const ModelOfTableHeaders("Получатель", 1),
    ];
  }
}
