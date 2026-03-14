
mock "tfplan/v2" {
  module {
    source = "./mocks/fail/fail-no-managed-policies-attached.sentinel"
  }
}

mock "tfresources" {
  module {
    source = "../../../../modules/tfresources/tfresources.sentinel"
  }
}

mock "report" {
  module {
    source = "../../../../modules/mocks/report/report.sentinel"
  }
}

param "required_managed_policies" {
  value = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess",
    "arn:aws:iam::aws:policy/SecurityAudit",
    "arn:aws:iam::aws:policy/ViewOnlyAccess"
  ]
}

test {
  rules = {
    main = false
  }
}
