//*************************************************
//
//     _                 _      _
//    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
//    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
//    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
//                Sup dudes!
//
//*************************************************

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}