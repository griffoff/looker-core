explore: root {
  hidden: yes
  from: root
  view_name: root
}

view: root {
  # dummy table used as the base of all explores
  # so that looker's extensions do not cause conflicts
  derived_table: {sql: SELECT NULL;;}
}
