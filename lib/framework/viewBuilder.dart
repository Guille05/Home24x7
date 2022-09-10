
import 'package:home24x7/framework/view.dart';
import 'package:home24x7/framework/viewActions.dart';
import 'package:home24x7/framework/viewModel.dart';

abstract class ViewBuilder<V extends View, VM extends ViewModel, VA extends ViewActions> {
  V createView(VM? viewModel, VA viewActions);
}
