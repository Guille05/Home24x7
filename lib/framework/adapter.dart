
import 'businessModel.dart';

abstract class Adapter<BM extends BusinessModel, DM extends DataModel> {
  Future<BM> createBusinessModel(DM? dataModel);

  Future<DM> createDataModel(BM businessModel);
}
