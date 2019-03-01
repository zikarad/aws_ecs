resource "aws_ecs_cluster" "ecs-main" {
  name = "${var.clname}"

  tags = "${
    map(
      "Creator", "zikar",
      "stage",   "${var.stage}"
    )
  }"
}

resource "aws_ecs_service" "ecss-web" {
  name            = "${var.svcname}"
  cluster         = "${aws_ecs_cluster.ecs-main.id}"
  task_definition = "${aws_ecs_task_definition.web.arn}"
  desired_count   = "${var.taskcount}"
  #iam_role       = "${aws_iam_role.foo.arn}"
  #depends_on     = ["aws_iam_role_policy.foo"]
  launch_type     = "FARGATE"

  #network_configuration = {}
  #load_balancer  = {}
  #depends_on     = {}
}

resource "aws_ecs_task_definition" "web" {
  family                   = "app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.fargate_cpu}"
  memory                   = "${var.fargate_memory}"
  container_definitions    = <<CONTAINER
 [
    {
      "cpu": ${var.fargate_cpu},
      "image": "nginx:latest",
      "memory": ${var.fargate_memory},
      "name": "nginx",
      "networkMode": "awsvpc",
      "portMappings": [
        {
          "hostPort": 80,
          "containerPort": 80
        }
      ]
    }
  ]
CONTAINER
}
