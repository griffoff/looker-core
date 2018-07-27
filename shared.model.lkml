connection: "snowflake_prod"

include: "*.view.lkml"         # include all views in this project
include: "common.lkml"

explore: snowflake_history {}
