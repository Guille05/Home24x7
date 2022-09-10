
import 'package:home24x7/framework/pipe.dart';
import 'package:home24x7/framework/viewModel.dart';

import 'blocEvent.dart';

abstract class Bloc<VM extends ViewModel, BE extends BlocEvent> {
  Pipe<BE> pipeIn = Pipe();
  Pipe<VM> pipeOut = Pipe();

  Bloc() {
    pipeIn.receive.listen(onReceiveBlocEvent);
  }

  void onReceiveBlocEvent(BE blocEvent);

  void sendViewModelOut(VM viewModel) {
    pipeOut.send(viewModel);
  }
}
