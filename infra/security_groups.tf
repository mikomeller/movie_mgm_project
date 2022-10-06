resource "aws_security_group" "movie_app_sg" {
  name        = "movie-app-sg"
  description = "SG for movie mgmt app"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description      = "Access to Flask app"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] 
    # was: cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  ingress {
    description      = "ssh conn to the server"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # all in
    # cidr_blocks      = ["31.17.149.205/32"] 
    # was: cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }



  egress {
    description = "Access to the internet"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] # TCP + UDP simultaneously
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "movie-app-sg"
  }
}

resource "aws_security_group" "db_movie_sg" {
  name        = "movie-db-sg"
  description = "SG for movie mgmt db"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description      = "Access to Flask app"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] 
    security_groups = [aws_security_group.movie_app_sg.id]
    # was: cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  ingress {
    description      = "ssh conn to the server"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # all in
    # cidr_blocks      = ["31.17.149.205/32"] 
    # was: cidr_blocks      = [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }



  egress {
    description = "Access to the internet"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] # TCP + UDP simultaneously
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "movie-app-sg"
  }
}