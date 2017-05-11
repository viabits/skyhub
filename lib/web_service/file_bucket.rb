class FileBucket
  def self.upload(file_name, file_path)
    s3 = S3_BUCKET.object(file_name)
    s3.upload_file(file_path, acl: 'public-read')
    s3.public_url
  end
end
