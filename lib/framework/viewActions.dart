import 'package:home24x7/framework/pipe.dart';
import 'blocEvent.dart';

abstract class ViewActions<BE extends BlocEvent> {
  final Pipe<BE> blocPipeIn;

  ViewActions(this.blocPipeIn);
}
