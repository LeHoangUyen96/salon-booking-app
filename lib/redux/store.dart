import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import './IStore.dart';
import './reducers.dart';

final Store<AppState> store = Store<AppState>(
  appStateReducer,
  initialState: AppState.initial(),
  middleware: <dynamic Function(Store<AppState>, dynamic, dynamic Function(dynamic))>[thunkMiddleware],
);
