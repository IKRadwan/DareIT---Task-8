resource "google_storage_bucket" "static" {
  name          = "dareit_task8_bucket"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
  }
}


resource "google_storage_bucket_object" "default" {
  name   = "index.html"
  source = "index.html"
  bucket = google_storage_bucket.static.id
}

resource "google_storage_bucket_iam_member" "member" {
  provider = google
  bucket   = google_storage_bucket.static.id
  role     = "roles/storage.objectViewer"
  member   = "allUsers"
}
