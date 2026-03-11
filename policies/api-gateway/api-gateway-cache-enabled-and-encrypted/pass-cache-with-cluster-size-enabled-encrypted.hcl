
mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-cache-with-cluster-size-enabled-encrypted.sentinel"
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
