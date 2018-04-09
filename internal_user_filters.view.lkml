view: internal_user_email_filters {
  derived_table: {
    sql:
      select column1 as like_filter
      from values
          ('%cengage.com')
          ,( '%nelson.com')
          ,( '%@thomson.com')
          ,( '%@thomsonlearning.com')
          ,( '%aplia.com')
          ,( '%@acms.com')
          ,( '%@qai.com')
          ,( '%@qait.com')
          ,( '%@qait.net')
          ,( '%@qaittest.com')
          ,( '%@qainfotech.net')
          ,( '%hmhpub.com')
          ,( '%@clmstest.com')
          ,( '%@test.com')
          ,( '%@load.com')
          ,( '%@lunarlogic.com')
          ,( '%@concentricsky.com')
          ,( '%@qa.com')
          ,( '%coursetech2012.com')
          ,( '%@prod.com')
          ,( '%@artislogicae.com')
          ,( '%@techizen.com')
          ,( '%@production.com')
          ,( '%@premediaglobal.com')
          ,( '%_mtqa@%')
          ,( '%@mt.com')
          ,( '%@deleteme.com')
          ,( '%@development.edu')

          ,('%@swlearning.com')
          ,('app_%')
          ,('%@amazon.com')
          ,('%@follett.com')
          --,('%@ktimmons.com')
          ,('%@acms.com')
          ,('%mindtap%')
          ,('stafford.cengage@yahoo.com')
          ,('sanjayinstprod%@gmail.com')
          ,('jbcengage@yahoo.com')
          ,('%ktimmons%')
          ,('%@artislogicae.com')
          --additional filters from mindtap DBA
          ,('%testaccount.com')
          ,('%development.%')
          ,('%cengage1.com')
          ,('%qaitest.com'
          ,('%@mtx.com'
          ,('%@mtxqa.com'
          ,('%@henley.com'
          ,('%@cengagetest.com'
          ,('%@ng.com'
          ,('%@qa4u.com'
          ,('inst1_gateway_130514@yahoo.com')
          ,('01_gtwy_instructor_30042015@gmail.com')
          ,('i1_instructor_16052014@gmail.com')
          ,('i9_instructor_040814@gmail.com')
          ,('i19_instructor_091014@gmail.com')
          ;;
    }

    dimension: like_filter {
      hidden: yes
    }

    dimension: is_internal {
      sql: ${like_filter} is not null ;;
    }
  }


view: internal_org_filters {
  derived_table: {
    sql:
      select column1 as org_external_id
      from values
        ('AD')
        ,('CS2008')
        ,('203410')
        ,('213054')
        ,('7924')
        ,('CPAC2009')
        ,('CNOWTS')
        ,('intl2008')
        ,('APLIA')
        ,('NELSONEDU')
        ,('DEMOBOOKINST')
        ,('THOMSON_GENERA')
        ,('Thomson')
        ,('qainfotech')
        ,('otqa')
        ,('thomson')
        ,('1-XJH2WF')
        ,('23876799')
        ,('4303')
        ;;
  }

  dimension: org_external_id {
    hidden: yes
  }

  dimension: is_internal {
    sql: ${org_external_id} is not null ;;
  }
}
