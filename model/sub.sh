for f in $(find -name dune) 
do  
  for n in protocol_exts venue_types venue_strings_venue venue_helper_functions conversions venue types_pp string_factory core_time_defaults core_fresh protocol_exts_pp core_time_defaults_pp simulation_utils_gen
  do
    sed -i "s/fix-engine.$n/model.$n/g" $f
  done
done
