access_grant: can_view_CU_dev_data {
  user_attribute: access_grant_team
  allowed_values: [ "yes" ]
}

access_grant: can_view_CU_pii_data {
  user_attribute:access_pii_data
  allowed_values: [ "yes" ]
}

access_grant: can_view_segment_parameters {
  user_attribute: access_segment_creation
  allowed_values: ["yes"]
}

access_grant: can_view_cube_dev{
  user_attribute: access_cube_dev
  allowed_values: ["yes"]
}
