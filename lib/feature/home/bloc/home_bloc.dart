import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopigo_mobile/feature/home/model/inventory_res_model.dart';
import 'package:shopigo_mobile/repository/home_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository repository = HomeRepository();
  HomeBloc() : super(HomeInitial()) {
    on<RequestHomeData>((event, emit) => _onRequestHomeData(event, emit));
  }

  _onRequestHomeData(RequestHomeData event, Emitter emit) async {
    emit(HomeFetchingData());
    try {
      InventoryResModel result = await repository.getAllInventoryApi();
      print(result);
      emit(HomeFetchDataSuccess(result));
    } catch (e) {
      print(e);
    }
  }
}
