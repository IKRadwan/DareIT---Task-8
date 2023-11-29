resource "google_storage_bucket" "static" {
  name          = "dareit_task8_terraform"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_iam_member" "member" {
  provider = google
  bucket   = "dareit_task8_terraform"
  role     = "roles/storage.objectViewer"
  member   = "allUsers"
}


resource "google_storage_bucket_object" "static-website" {
  name   = "index.html"
  source = "./website/index.html"
  bucket = "dareit_task8_terraform"
}

resource "google_storage_bucket_object" "picture" {
  name   = "myimage.png"
  source = "./website/images/myimage.png"
  bucket = "dareit_task8_terraform"
}