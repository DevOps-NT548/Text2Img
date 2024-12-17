.PHONY:   build_app_image register_app_image app_local_up app_helm_up 


# deploy app in local
app_local_up:
	docker compose -f deployment/model_predictor/docker-compose.yaml up -d

# build image classifier app
build_app_image:
	docker build -f deployment/model_predictor/Backend_Dockerfile -t kevvn/txt2img_backend:0.0.1 .
	docker build -f deployment/model_predictor/Frontend_Dockerfile -t kevvn/txt2img_frontend:0.0.1 .

register_app_image:
	docker push kevvn/txt2img_backend:0.0.1
	docker push kevvn/txt2img_frontend:0.0.1