/*************************************************

     _                 _      _
    | |_ __ __ __ ___ | | ___| |_  ___  _ _  ___
    | ' \\ V  V // -_)| |(_-<|  _|/ -_)| '_|(_-<
    |_||_|\_/\_/ \___||_|/__/ \__|\___||_|  /__/
                Sup dudes!

*************************************************/

# ---- Container Repository ---
module "ecr_repository" {
  source = "./modules/ecr"
  name   = "ecr_repo"
}

# -------- ECS Cluster --------
module "ecs" {
  source = "./modules/ecs"
  name   = "ecs"
}
