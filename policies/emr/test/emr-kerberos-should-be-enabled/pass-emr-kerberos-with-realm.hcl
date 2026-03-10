
mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-emr-kerberos-with-realm.sentinel"
  }
}

mock "tfresources" {
  module {
    source = "../../modules/tfresources/tfresources.sentinel"
  }
}

mock "report" {
  module {
    source = "../../modules/mocks/report/report.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
