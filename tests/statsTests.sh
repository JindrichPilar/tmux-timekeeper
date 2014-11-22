sess_name="my_super_session_name";
wind_name="my_even_better_window_name";


TTK_STORAGE_PREFIX="my"

stub $TTK_STORAGE_PREFIX"_statsCommands";
stub $TTK_STORAGE_PREFIX"_statsSessionPaths";
stub $TTK_STORAGE_PREFIX"_statsSession";
stub $TTK_STORAGE_PREFIX"_statsSessionCommands";
stub $TTK_STORAGE_PREFIX"_statsSessionPaths";
stub $TTK_STORAGE_PREFIX"_statsSessionWindow";
stub $TTK_STORAGE_PREFIX"_statsSessionWindowCommands";
stub $TTK_STORAGE_PREFIX"_statsSessions";
stub $TTK_STORAGE_PREFIX"_statsPaths";


statsSessions;
assert_raises "stub_called_with_exactly_times my_statsSessions 1";


statsSession "$sess_name";
assert_raises "stub_called_with_exactly_times my_statsSession 1 $sess_name";


statsSessionPaths "$sess_name";
assert_raises "stub_called_with_exactly_times my_statsSessionPaths 1 $sess_name";


statsSessionCommands "$sess_name";
assert_raises "stub_called_with_exactly_times my_statsSessionCommands 1 $sess_name";


statsSessionWindow "$sess_name" "$wind_name";
assert_raises "stub_called_with_exactly_times my_statsSessionWindow 1 $sess_name $wind_name";


statsSessionWindowCommands "$sess_name" "$wind_name";
assert_raises "stub_called_with_exactly_times my_statsSessionWindowCommands 1 $sess_name $wind_name";


statsCommands;
assert_raises "stub_called_with_exactly_times my_statsCommands 1";


statsPaths;
assert_raises "stub_called_with_exactly_times my_statsPaths 1";


assert_end "Stats tests"
