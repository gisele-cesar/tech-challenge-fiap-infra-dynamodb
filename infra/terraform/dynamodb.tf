resource "aws_dynamodb_table" "fiap_pedido" {
   name             = "fiap-video-upload"
   hash_key         = "Id"
   billing_mode   = "PROVISIONED"
   read_capacity  = 3
   write_capacity = 3
   attribute {
     name = "Id"
     type = "S"
   }
}