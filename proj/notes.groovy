user:- sharmavishal00911_db_user
pass:- dED7Hsy5WZGWYWii



mongosh "mongodb+srv://student.hi15vbh.mongodb.net/" --apiVersion 1 --username sharmavishal00911_db_user --password dED7Hsy5WZGWYWii
db name:- stu_db
colletion name:- students
sample data:-
Atlas atlas-k9svye-shard-0 [primary] stu_db> db.students.find()
[
  {
    _id: ObjectId('69a82946bdd6dd1b43b7c8df'),
    name: 'Vishal',
    class: '12',
    math_marks: Long('89'),
    no_sub: Long('3'),
    sci_marks: Long('98'),
    sst: Long('90')
  }
]


please create project for me student management system whose frontend in react vite, backend in python. to connect frontend and backend use flask, as  i am learning python so keep it very easy. after this I want to test it locally please help me to run it in local ubuntu system where I already isntalled python3 and node24. later I want to containerized the application using dockerfile no docker compose. so help me tu run using docker containers also. create two containers one for frontend and another for backend. give me dockerfile also.
use mogodb for database connect it to backend I have already created a mongodb database and add colletion into it, this is  my connections string for mongo:-
mongosh "mongodb+srv://student.hi15vbh.mongodb.net/" --apiVersion 1 --username sharmavishal00911_db_user --password XXXXXXXXXXXXX
db name:- stu_db
colletion name:- students
sample data below. you can add new collections and data into it.
Atlas atlas-k9svye-shard-0 [primary] stu_db> db.students.find()
[
  {
    _id: ObjectId('69a82946bdd6dd1b43b7c8df'),
    name: 'Vishal',
    class: '12',
    math_marks: Long('89'),
    no_sub: Long('3'),
    sci_marks: Long('98'),
    sst: Long('90')
  }
]
I need to add students, students id, total subsjects for that ask user the total number of subjects and input that how many subjects and marks for subjects then calculate the total_marks, averege_marks, max_marks, min_marks, no_subjects. 

then once its deployed in docker container, then I need to use my already configured kind cluster in my laptop using kubernetes deployment. and service. so please give me the yml file for this which can help me to run the application. I need to build the docker image then push it to dockerhub then pull that image into my deployment image, I dont want to load image into kind. then later on I want to deploy it on cloud but that is the later part not for today. 

please give me all the forntend and backend code including index.html, package.json... etc
also give me file structure

also please dont hardcode anything, give all credentail or secrets in env file


########################################

local:-

cd backend
pip install -r requirements.txt
python app.py


cd frontend
npm install
npm run dev


http://localhost:5173


# docker

docker build -t 


// docker login -u careerdeveloper1
// dckr_pat_C7nGKJNFROheV8bFwnFm37yv-V8

// docker build -t careerdeveloper1/vishalmegamart:v1 .
// docker push careerdeveloper1/vishalmegamart:v1

docker info
docker login -u sharmarjit1986
dckr_pat_r0FQI1Gk8Mvt97B96aI1bneQ-6g

docker build -t sharmarjit1986/sbe:v1 .
docker build --no-cache -t sharmarjit1986/sbe:v1 .
docker push sharmarjit1986/sbe:v1


docker build --no-cache -t sharmarjit1986/sbe:v1 /home/sharma/work/python_terra/to_gitlab/pk/proj/student-management-system/backend
docker build --no-cache -t sharmarjit1986/sfe:v1 /home/sharma/work/python_terra/to_gitlab/pk/proj/student-management-system/frontend

docker push sharmarjit1986/sbe:v1
docker push sharmarjit1986/sfe:v1



docker build -t sharmarjit1986/sfe:v1 .
docker push sharmarjit1986/sfe:v1

docker run -d -p 5000:5000 --env-file backend/.env yourdockerhub/backend:1.0

docker run -d -p 5173:5173 yourdockerhub/frontend:1.0

docker run -d --name sbe -p 5000:5000 --env-file backend/.env sharmarjit1986/sbe:v1
docker run -d --name sfe -p 5173:5173 --env-file backend/.env sharmarjit1986/sfe:v1
docker run -d --name sfe -p 5173:5173 --env-file ../frontend/.env sharmarjit1986/sfe:v1


docker run -d --name sbe -p 5000:5000 sharmarjit1986/sbe:v1
docker run -d --name sfe -p 4173:4173 --env-file .env sharmarjit1986/sfe:v1

docker run -d --name sbe -p 5000:5000 --env-file ../backend/.env sharmarjit1986/sbe:v1
docker run -d --name sfe -p 4173:4173 --env-file ../frontend/.env sharmarjit1986/sfe:v1


docker rm -f sbe sfe
docker run -d --name sbe --network vishal -p 5000:5000 --env-file backend/.env sharmarjit1986/sbe:v1
docker run -d --name sfe --network vishal -p 4173:4173 --env-file frontend/.env sharmarjit1986/sfe:v1

docker run -d --name sbe --network vishal -p 5000:5000 sharmarjit1986/sbe:v1
docker run -d --name sfe --network vishal -p 4173:4173 sharmarjit1986/sfe:v1


docker rm -f sfe sbe


##############################################################
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  image: kindest/node:v1.32.0  # Update the version here
- role: worker
  image: kindest/node:v1.32.0  # Update the version here
- role: worker
  image: kindest/node:v1.32.0  # Update the version here
  extraPortMappings: 
  - containerPort: 80
    hostPort: 80
  - containerPort: 443
    hostPort: 443



###########################

mongosh "mongodb+srv://student.hi15vbh.mongodb.net/" --apiVersion 1 --username sharmavishal00911_db_user --password dED7Hsy5WZGWYWii
Current Mongosh Log ID: 69a82872a6db8fa88f8563b0
Connecting to:          mongodb+srv://<credentials>@student.hi15vbh.mongodb.net/?appName=mongosh+2.7.0
Using MongoDB:          8.0.19 (API Version 1)
Using Mongosh:          2.7.0

For mongosh info see: https://www.mongodb.com/docs/mongodb-shell/

Atlas atlas-k9svye-shard-0 [primary] test> db
test
Atlas atlas-k9svye-shard-0 [primary] test> show dbs
stu_db    8.00 KiB
admin   344.00 KiB
local    13.57 GiB
Atlas atlas-k9svye-shard-0 [primary] test> use stu_db
switched to db stu_db
Atlas atlas-k9svye-shard-0 [primary] stu_db> show collections
students
Atlas atlas-k9svye-shard-0 [primary] stu_db> show collections
students
Atlas atlas-k9svye-shard-0 [primary] stu_db> db.students.find()


#############################################################