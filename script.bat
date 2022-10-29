echo "Criando as Imagens ....."

docker build -t AndreMoreira/projeto-backend:1.0 backend/.
docker build -t AndreMoreira/projeto-database:1.0 database/.

echo "Realizando o push das Imagens"

docker push AndreMoreira/projeto-backend:1.0
docker push AndreMoreira/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml


echo "Criando os deployment..."

kubectl apply -f ./deployment.yml

