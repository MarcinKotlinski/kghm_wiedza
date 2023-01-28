import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:home_repository/home_repository.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:home_api/home_api.dart';


part 'home_event.dart';
part 'home_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository,
        super(const HomeState()) {
    on<MenuItemFetched>(
      _onInstitutionFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final HomeRepository _homeRepository;

  Future<void> _onInstitutionFetched(
      MenuItemFetched event,
      Emitter<HomeState> emit,
      ) async {
    try {
      if (state.status == HomeStatus.initial) {
        final menuItems = await _fetchMenuItems();
        return emit(state.copyWith(
          status: HomeStatus.success,
          menuItems: menuItems,
        ));
      }
      final items = await _fetchMenuItems();
      state.copyWith(
        status: HomeStatus.success,
        menuItems: List.of(state.menuItems)..addAll(items),
      );
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<List<MenuItem>> _fetchMenuItems() async {
    final response = await _homeRepository.getMenuItems();
    return response;
  }
}
