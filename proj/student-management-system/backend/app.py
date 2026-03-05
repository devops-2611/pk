import os
from flask import Flask, request, jsonify
from flask_cors import CORS
from pymongo import MongoClient
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)
CORS(app)

# Environment variables
mongo_uri = os.getenv("MONGO_URI")
db_name = os.getenv("DB_NAME")
collection_name = os.getenv("COLLECTION_NAME")
port = int(os.getenv("PORT", 5000))

client = MongoClient(mongo_uri)
db = client[db_name]
collection = db[collection_name]


@app.route("/students", methods=["GET"])
def get_students():
    students = list(collection.find({}, {"_id": 0}))
    return jsonify(students)


@app.route("/students", methods=["POST"])
def add_student():
    data = request.json

    student_id = data["student_id"]
    name = data["name"]
    subjects = data["subjects"]

    marks_list = [sub["marks"] for sub in subjects]

    total_marks = sum(marks_list)
    average_marks = total_marks / len(marks_list)
    max_marks = max(marks_list)
    min_marks = min(marks_list)
    no_subjects = len(subjects)

    student_data = {
        "student_id": student_id,
        "name": name,
        "subjects": subjects,
        "total_marks": total_marks,
        "average_marks": average_marks,
        "max_marks": max_marks,
        "min_marks": min_marks,
        "no_subjects": no_subjects
    }

    collection.insert_one(student_data)

    return jsonify({"message": "Student added successfully"}), 201


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=port)