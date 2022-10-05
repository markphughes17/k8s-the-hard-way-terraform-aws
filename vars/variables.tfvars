common_tags = {
    "CreatedBy" = "Mark Hughes"
    "project"   = "k8s"
    "Name"      = "Mark K8s"
}

vpc_cidr = "10.10.0.0/16"
public_subnet_cidr = "10.10.1.0/24"
web_cidr = "0.0.0.0/0"

ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLhYf6+Tt103SBMMHPhEaNhMZmyysLJtoupE/POABJxU29uKDjWoWBD/EbgNw4yfRfMNnTvb0N5zlPPPVmDIUASDhFacYi5FGUCQIuGS1PMMhcpcVKBkuSOoQ6tkiwaFXVhKPXVDbSDiq/WtW+ZZivFenT4aCmVYRxma029YG8YOcpgEHPwKOSGKUZTY6mP+wgA9xea6Hufra8B+BReJD8wqj3tyoN92nWe/fiZ4Ipqn6RwUTlDnMYlcKhSJwpOA4EGo3FG/6hVmh0FnBBc02lraTnwR7R++7MVeRZTYUqS1t3rGB5nB1ufRRGmL0/gpCAK1la5/V9auvfNP6OmAfrkNU/gOeaYSQ9oAh4om8AM9wk8fEBYAZhTD76Y7zKVbKmJG7MhqbGiQlp62QkUxw1rvOn+hgsFFPP0+cScloD1dpBVNpZGCcmVjbmYdmwiv2lao9lmZWxS9g2agxKAIC0DBvpINKZx6B6qLsR90opk+GNTPJSc5Wm3/mPd8tCIdE= mark@Marks-MacBook-Pro.local"

instance_count = 3
instance_type = "t3.micro"