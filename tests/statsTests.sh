TTK_statsCommands="my_statsCommands";
TTK_statsPaths="my_statsPaths";
TTK_statsSession="my_statsSession";
TTK_statsSessionCommands="my_statsSessionCommands";
TTK_statsSessionPaths="my_statsSessionPaths";
TTK_statsSessionWindow="my_statsSessionWindow";
TTK_statsSessionWindowCommands="my_statsSessionWindowCommands";
TTK_statsSessions="my_statsSessions";



sess_name="my_super_session_name";
wind_name="my_even_better_window_name";


stub "my_statsCommands";
stub "my_statsSessionPaths";
stub "my_statsSession";
stub "my_statsSessionCommands";
stub "my_statsSessionPaths";
stub "my_statsSessionWindow";
stub "my_statsSessionWindowCommands";
stub "my_statsSessions";
stub "my_statsPaths";


statsSessions;
assert_raises "stub_called_with_exactly_times my_statsSessions 1";


statsSession $sess_name;
assert_raises "stub_called_with_exactly_times my_statsSession 1 $sess_name";


statsSessionPaths $sess_name;
assert_raises "stub_called_with_exactly_times my_statsSessionPaths 1 $sess_name";


statsSessionCommands $sess_name;
assert_raises "stub_called_with_exactly_times my_statsSessionCommands 1 $sess_name";


statsSessionWindow $sess_name $window_name;
assert_raises "stub_called_with_exactly_times my_statsSessionWindow 1 $sess_name $window_name";


statsSessionWindowCommands $sess_name $window_name;
assert_raises "stub_called_with_exactly_times my_statsSessionWindowCommands 1 $sess_name $window_name";


statsCommands;
assert_raises "stub_called_with_exactly_times my_statsCommands 1";


statsPaths;
assert_raises "stub_called_with_exactly_times my_statsPaths 1";




assert_end "Stats tests"
