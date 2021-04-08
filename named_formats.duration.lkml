#################################################################################################################
#
# ALL DURATION_* FORMATS WORK WITH MEASURES THAT ARE TIME/DURATION REPRESENTATIONS OF A PORTION OF A DAY
#
#################################################################################################################


# these two formats are creating validation issues - with look support
# this is due to a bug with the fast formatter, will be fixed in future versions
named_value_format: duration_mdh {
  #value_format: "M m\o\n\t\h\s d \da\y\s h \h\ou\r\s"
  value_format: "M:dd:hh"
}

named_value_format: duration_dhm {
#  value_format: "d \d\a\y\s hh:mm"
  value_format: "d \d\a\y\s hh:mm:ss"
}
################################

named_value_format: duration_hms {
  value_format: "[h]:mm:ss"
}

named_value_format: duration_minutes {
  value_format: "[m]:ss \m\i\n\s"
}

named_value_format: duration_days {
  #value_format: "d \da\y\s h \hr\s m \mi\n\s s \sec\s"
  value_format: "d \d\a\y\s"
}

named_value_format: duration_ymd {
  value_format: "Y \y\e\a\r M \m\o\n\t\h\s d \d\a\y\s"
}

named_value_format: duration_hms_full {
  value_format: "[h] \h\r\s m \m\i\n\s s \s\e\c\s"
}
