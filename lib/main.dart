import 'package:najottalim_teachersapp/utils/tools/file_importer.dart';
import 'package:najottalim_teachersapp/utils/tools/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  runApp(const App());
}
