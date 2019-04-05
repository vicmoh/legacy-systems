pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Community 2018 (20180523-73)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_spigot" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#6210cccf#;
   pragma Export (C, u00001, "spigotB");
   u00002 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#0f7d71d4#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00005, "ada__charactersS");
   u00006 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00006, "ada__characters__handlingB");
   u00007 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00007, "ada__characters__handlingS");
   u00008 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00008, "ada__characters__latin_1S");
   u00009 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00009, "ada__stringsS");
   u00010 : constant Version_32 := 16#085b6ffb#;
   pragma Export (C, u00010, "systemS");
   u00011 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00011, "system__exception_tableB");
   u00012 : constant Version_32 := 16#55f506b9#;
   pragma Export (C, u00012, "system__exception_tableS");
   u00013 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00013, "system__soft_linksB");
   u00014 : constant Version_32 := 16#4d58644d#;
   pragma Export (C, u00014, "system__soft_linksS");
   u00015 : constant Version_32 := 16#bd45c2cc#;
   pragma Export (C, u00015, "system__secondary_stackB");
   u00016 : constant Version_32 := 16#4dcf97e2#;
   pragma Export (C, u00016, "system__secondary_stackS");
   u00017 : constant Version_32 := 16#f8088b52#;
   pragma Export (C, u00017, "ada__exceptionsB");
   u00018 : constant Version_32 := 16#16307b94#;
   pragma Export (C, u00018, "ada__exceptionsS");
   u00019 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00019, "ada__exceptions__last_chance_handlerB");
   u00020 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00020, "ada__exceptions__last_chance_handlerS");
   u00021 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00021, "system__exceptionsB");
   u00022 : constant Version_32 := 16#6038020d#;
   pragma Export (C, u00022, "system__exceptionsS");
   u00023 : constant Version_32 := 16#80916427#;
   pragma Export (C, u00023, "system__exceptions__machineB");
   u00024 : constant Version_32 := 16#3bad9081#;
   pragma Export (C, u00024, "system__exceptions__machineS");
   u00025 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00025, "system__exceptions_debugB");
   u00026 : constant Version_32 := 16#76d1963f#;
   pragma Export (C, u00026, "system__exceptions_debugS");
   u00027 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00027, "system__img_intB");
   u00028 : constant Version_32 := 16#0a808f39#;
   pragma Export (C, u00028, "system__img_intS");
   u00029 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00029, "system__storage_elementsB");
   u00030 : constant Version_32 := 16#259825ff#;
   pragma Export (C, u00030, "system__storage_elementsS");
   u00031 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00031, "system__tracebackB");
   u00032 : constant Version_32 := 16#5679b13f#;
   pragma Export (C, u00032, "system__tracebackS");
   u00033 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00033, "system__traceback_entriesB");
   u00034 : constant Version_32 := 16#0800998b#;
   pragma Export (C, u00034, "system__traceback_entriesS");
   u00035 : constant Version_32 := 16#bb296fbb#;
   pragma Export (C, u00035, "system__traceback__symbolicB");
   u00036 : constant Version_32 := 16#c84061d1#;
   pragma Export (C, u00036, "system__traceback__symbolicS");
   u00037 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00037, "ada__exceptions__tracebackB");
   u00038 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00038, "ada__exceptions__tracebackS");
   u00039 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00039, "system__address_imageB");
   u00040 : constant Version_32 := 16#a9b7f2c1#;
   pragma Export (C, u00040, "system__address_imageS");
   u00041 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00041, "system__wch_conB");
   u00042 : constant Version_32 := 16#13264d29#;
   pragma Export (C, u00042, "system__wch_conS");
   u00043 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00043, "system__wch_stwB");
   u00044 : constant Version_32 := 16#3e376128#;
   pragma Export (C, u00044, "system__wch_stwS");
   u00045 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00045, "system__wch_cnvB");
   u00046 : constant Version_32 := 16#1c91f7da#;
   pragma Export (C, u00046, "system__wch_cnvS");
   u00047 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00047, "interfacesS");
   u00048 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00048, "system__wch_jisB");
   u00049 : constant Version_32 := 16#9ce1eefb#;
   pragma Export (C, u00049, "system__wch_jisS");
   u00050 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00050, "system__parametersB");
   u00051 : constant Version_32 := 16#40b73bd0#;
   pragma Export (C, u00051, "system__parametersS");
   u00052 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00052, "system__soft_links__initializeB");
   u00053 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00053, "system__soft_links__initializeS");
   u00054 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00054, "system__stack_checkingB");
   u00055 : constant Version_32 := 16#86e40413#;
   pragma Export (C, u00055, "system__stack_checkingS");
   u00056 : constant Version_32 := 16#96df1a3f#;
   pragma Export (C, u00056, "ada__strings__mapsB");
   u00057 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00057, "ada__strings__mapsS");
   u00058 : constant Version_32 := 16#98e13b0e#;
   pragma Export (C, u00058, "system__bit_opsB");
   u00059 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00059, "system__bit_opsS");
   u00060 : constant Version_32 := 16#3cdd1378#;
   pragma Export (C, u00060, "system__unsigned_typesS");
   u00061 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00061, "ada__strings__maps__constantsS");
   u00062 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00062, "ada__integer_text_ioB");
   u00063 : constant Version_32 := 16#082ea75f#;
   pragma Export (C, u00063, "ada__integer_text_ioS");
   u00064 : constant Version_32 := 16#927a893f#;
   pragma Export (C, u00064, "ada__text_ioB");
   u00065 : constant Version_32 := 16#1ffab6e1#;
   pragma Export (C, u00065, "ada__text_ioS");
   u00066 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00066, "ada__streamsB");
   u00067 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00067, "ada__streamsS");
   u00068 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00068, "ada__io_exceptionsS");
   u00069 : constant Version_32 := 16#d398a95f#;
   pragma Export (C, u00069, "ada__tagsB");
   u00070 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00070, "ada__tagsS");
   u00071 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00071, "system__htableB");
   u00072 : constant Version_32 := 16#8c99dc11#;
   pragma Export (C, u00072, "system__htableS");
   u00073 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00073, "system__string_hashB");
   u00074 : constant Version_32 := 16#2ec7b76f#;
   pragma Export (C, u00074, "system__string_hashS");
   u00075 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00075, "system__val_lluB");
   u00076 : constant Version_32 := 16#462f440a#;
   pragma Export (C, u00076, "system__val_lluS");
   u00077 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00077, "system__val_utilB");
   u00078 : constant Version_32 := 16#a4fbd905#;
   pragma Export (C, u00078, "system__val_utilS");
   u00079 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00079, "system__case_utilB");
   u00080 : constant Version_32 := 16#378ed9af#;
   pragma Export (C, u00080, "system__case_utilS");
   u00081 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00081, "interfaces__c_streamsB");
   u00082 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00082, "interfaces__c_streamsS");
   u00083 : constant Version_32 := 16#4e0ce0a1#;
   pragma Export (C, u00083, "system__crtlS");
   u00084 : constant Version_32 := 16#ec083f01#;
   pragma Export (C, u00084, "system__file_ioB");
   u00085 : constant Version_32 := 16#af2a8e9e#;
   pragma Export (C, u00085, "system__file_ioS");
   u00086 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00086, "ada__finalizationS");
   u00087 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00087, "system__finalization_rootB");
   u00088 : constant Version_32 := 16#47a91c6b#;
   pragma Export (C, u00088, "system__finalization_rootS");
   u00089 : constant Version_32 := 16#0f8892f9#;
   pragma Export (C, u00089, "system__os_libB");
   u00090 : constant Version_32 := 16#d8e681fb#;
   pragma Export (C, u00090, "system__os_libS");
   u00091 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00091, "system__stringsB");
   u00092 : constant Version_32 := 16#684d436e#;
   pragma Export (C, u00092, "system__stringsS");
   u00093 : constant Version_32 := 16#f5c4f553#;
   pragma Export (C, u00093, "system__file_control_blockS");
   u00094 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00094, "ada__text_io__integer_auxB");
   u00095 : constant Version_32 := 16#09097bbe#;
   pragma Export (C, u00095, "ada__text_io__integer_auxS");
   u00096 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00096, "ada__text_io__generic_auxB");
   u00097 : constant Version_32 := 16#16b3615d#;
   pragma Export (C, u00097, "ada__text_io__generic_auxS");
   u00098 : constant Version_32 := 16#b10ba0c7#;
   pragma Export (C, u00098, "system__img_biuB");
   u00099 : constant Version_32 := 16#faff9b35#;
   pragma Export (C, u00099, "system__img_biuS");
   u00100 : constant Version_32 := 16#4e06ab0c#;
   pragma Export (C, u00100, "system__img_llbB");
   u00101 : constant Version_32 := 16#bb388bcb#;
   pragma Export (C, u00101, "system__img_llbS");
   u00102 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00102, "system__img_lliB");
   u00103 : constant Version_32 := 16#19143a2a#;
   pragma Export (C, u00103, "system__img_lliS");
   u00104 : constant Version_32 := 16#a756d097#;
   pragma Export (C, u00104, "system__img_llwB");
   u00105 : constant Version_32 := 16#1254a85d#;
   pragma Export (C, u00105, "system__img_llwS");
   u00106 : constant Version_32 := 16#eb55dfbb#;
   pragma Export (C, u00106, "system__img_wiuB");
   u00107 : constant Version_32 := 16#94be1ca7#;
   pragma Export (C, u00107, "system__img_wiuS");
   u00108 : constant Version_32 := 16#d763507a#;
   pragma Export (C, u00108, "system__val_intB");
   u00109 : constant Version_32 := 16#40fe45c4#;
   pragma Export (C, u00109, "system__val_intS");
   u00110 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00110, "system__val_unsB");
   u00111 : constant Version_32 := 16#2c75fe43#;
   pragma Export (C, u00111, "system__val_unsS");
   u00112 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00112, "system__val_lliB");
   u00113 : constant Version_32 := 16#927f895b#;
   pragma Export (C, u00113, "system__val_lliS");
   u00114 : constant Version_32 := 16#adb6d201#;
   pragma Export (C, u00114, "ada__strings__fixedB");
   u00115 : constant Version_32 := 16#a86b22b3#;
   pragma Export (C, u00115, "ada__strings__fixedS");
   u00116 : constant Version_32 := 16#2eb48a6d#;
   pragma Export (C, u00116, "ada__strings__searchB");
   u00117 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00117, "ada__strings__searchS");
   u00118 : constant Version_32 := 16#457fb2da#;
   pragma Export (C, u00118, "ada__strings__unboundedB");
   u00119 : constant Version_32 := 16#f39c7224#;
   pragma Export (C, u00119, "ada__strings__unboundedS");
   u00120 : constant Version_32 := 16#acee74ad#;
   pragma Export (C, u00120, "system__compare_array_unsigned_8B");
   u00121 : constant Version_32 := 16#a1581e76#;
   pragma Export (C, u00121, "system__compare_array_unsigned_8S");
   u00122 : constant Version_32 := 16#a8025f3c#;
   pragma Export (C, u00122, "system__address_operationsB");
   u00123 : constant Version_32 := 16#1b57d1c8#;
   pragma Export (C, u00123, "system__address_operationsS");
   u00124 : constant Version_32 := 16#2e260032#;
   pragma Export (C, u00124, "system__storage_pools__subpoolsB");
   u00125 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00125, "system__storage_pools__subpoolsS");
   u00126 : constant Version_32 := 16#d96e3c40#;
   pragma Export (C, u00126, "system__finalization_mastersB");
   u00127 : constant Version_32 := 16#53a75631#;
   pragma Export (C, u00127, "system__finalization_mastersS");
   u00128 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00128, "system__img_boolB");
   u00129 : constant Version_32 := 16#fd821e10#;
   pragma Export (C, u00129, "system__img_boolS");
   u00130 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00130, "system__ioB");
   u00131 : constant Version_32 := 16#961998b4#;
   pragma Export (C, u00131, "system__ioS");
   u00132 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00132, "system__storage_poolsB");
   u00133 : constant Version_32 := 16#2bb6f156#;
   pragma Export (C, u00133, "system__storage_poolsS");
   u00134 : constant Version_32 := 16#84042202#;
   pragma Export (C, u00134, "system__storage_pools__subpools__finalizationB");
   u00135 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00135, "system__storage_pools__subpools__finalizationS");
   u00136 : constant Version_32 := 16#020a3f4d#;
   pragma Export (C, u00136, "system__atomic_countersB");
   u00137 : constant Version_32 := 16#bc074276#;
   pragma Export (C, u00137, "system__atomic_countersS");
   u00138 : constant Version_32 := 16#039168f8#;
   pragma Export (C, u00138, "system__stream_attributesB");
   u00139 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00139, "system__stream_attributesS");
   u00140 : constant Version_32 := 16#27d2953a#;
   pragma Export (C, u00140, "ada__strings__unbounded__text_ioB");
   u00141 : constant Version_32 := 16#2e5d93ef#;
   pragma Export (C, u00141, "ada__strings__unbounded__text_ioS");
   u00142 : constant Version_32 := 16#2323a8af#;
   pragma Export (C, u00142, "system__memoryB");
   u00143 : constant Version_32 := 16#512609cf#;
   pragma Export (C, u00143, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.wch_stw%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  ada.exceptions%s
   --  system.wch_stw%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.last_chance_handler%s
   --  system.secondary_stack%s
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.address_image%s
   --  system.memory%s
   --  system.memory%b
   --  ada.exceptions.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.exceptions.last_chance_handler%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.address_image%b
   --  system.standard_library%b
   --  ada.exceptions%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_llu%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools%b
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.val_lli%s
   --  system.val_lli%b
   --  system.val_uns%s
   --  system.val_uns%b
   --  system.val_int%s
   --  system.val_int%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  ada.characters.handling%s
   --  ada.characters.handling%b
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.fixed%s
   --  ada.strings.fixed%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  ada.strings.unbounded.text_io%s
   --  ada.strings.unbounded.text_io%b
   --  spigot%b
   --  END ELABORATION ORDER

end ada_main;
