
mock "tfplan/v2" {
  module {
    source = "./mocks/fail/fail-emr-empty-kerberos-attributes.sentinel"
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
    main = false
  }
}
