varenvrg = {
  rg1 = {
    name     = "kv-rg01"
    location = "Central India"
    tags     = { env = "Dev" }
  }

}

varenvkv = {
  kv1 = {
    name   = "kubervaults01"
    rg-key = "rg1"
  }

}