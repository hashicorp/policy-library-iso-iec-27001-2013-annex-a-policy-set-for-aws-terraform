# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-federated-user-csv.sentinel"
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

param "federatedUsers" {
  value = "cognito-identity.amazonaws.com, arn:aws:iam::111122223333:saml-provider/my-provider"
}

test {
  rules = {
    main = true
  }
}