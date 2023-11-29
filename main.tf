resource "google_storage_bucket" "static" {
  name          = "dareit_task8_terraform"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "website/index.html"
  }
}

resource "google_storage_bucket_iam_member" "member" {
  provider = google
  bucket   = "dareit_task8_terraform"
  role     = "roles/storage.objectViewer"
  member   = "allUsers"
}


resource "google_storage_bucket_object" "static-website" {
  name   = "website/index.html"
  source = "website/index.html"
  bucket = "dareit_task8_terraform"
}

resource "google_storage_bucket_object" "picture" {
  name   = "website/images/myimage.png"
  source = "website/images/myimage.png"
  bucket = "dareit_task8_terraform"
}