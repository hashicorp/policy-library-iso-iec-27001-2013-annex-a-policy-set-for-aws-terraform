
mock "tfplan/v2" {
  module {
    source = "./mocks/fail/fail-ssh-port-range-includes-22-unrestricted.sentinel"
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
