webtalk_init -webtalk_dir /home/axel/Documentos/Contador hexbin/Contador hexbin.sim/sim_1/behav/xsim/xsim.dir/Contador_hexbin_behav/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Tue Apr 23 21:47:08 2019" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "XSIM v2018.3 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2405991" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "LIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "4feb4248-aaa3-468f-bdbc-28cea3fe08b5" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "ed44e9923abb4b79aa70d00d05dd44b8" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "58" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Ubuntu" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Ubuntu 18.04.2 LTS" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "2808.004 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "6.000 GB" -context "user_environment"
webtalk_register_client -client xsim
webtalk_add_data -client xsim -key Command -value "xsim" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key trace_waveform -value "true" -context "xsim\\usage"
webtalk_add_data -client xsim -key runtime -value "1 us" -context "xsim\\usage"
webtalk_add_data -client xsim -key iteration -value "2" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Time -value "0.15_sec" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Memory -value "133540_KB" -context "xsim\\usage"
webtalk_transmit -clientid 567982544 -regid "" -xml /home/axel/Documentos/Contador hexbin/Contador hexbin.sim/sim_1/behav/xsim/xsim.dir/Contador_hexbin_behav/webtalk/usage_statistics_ext_xsim.xml -html /home/axel/Documentos/Contador hexbin/Contador hexbin.sim/sim_1/behav/xsim/xsim.dir/Contador_hexbin_behav/webtalk/usage_statistics_ext_xsim.html -wdm /home/axel/Documentos/Contador hexbin/Contador hexbin.sim/sim_1/behav/xsim/xsim.dir/Contador_hexbin_behav/webtalk/usage_statistics_ext_xsim.wdm -intro "<H3>XSIM Usage Report</H3><BR>"
webtalk_terminate
