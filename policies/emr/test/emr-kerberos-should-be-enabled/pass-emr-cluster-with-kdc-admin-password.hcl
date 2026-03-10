
mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-emr-cluster-with-kdc-admin-password.sentinel"
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
