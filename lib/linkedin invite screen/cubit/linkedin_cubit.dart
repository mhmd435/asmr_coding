import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'linkedin_state.dart';

class LinkedinCubit extends Cubit<int> {
  LinkedinCubit() : super(0);

  changeChipButtonIndex(index) => emit(index);
}
