from flask import Flask, request, jsonify
import pandas as pd

app = Flask(__name__)

# Initial empty dataframe
fixed_columns = [
    "stu_id", "name", "no_subs",
    "marks_sum", "marks_ave",
    "marks_max", "marks_min"
]

df = pd.DataFrame(columns=fixed_columns)

# ------------------------------
# CREATE STUDENT (POST)
# ------------------------------
@app.route("/students", methods=["POST"])
def add_student():
    global df

    data = request.json
    name = data.get("name")
    subjects = data.get("subjects")  # dict like {"Math":90,"Eng":80}

    if not name or not subjects:
        return jsonify({"error": "Name and subjects required"}), 400

    stu_id = 1 if df.empty else df["stu_id"].max() + 1

    stu_data = {
        "stu_id": stu_id,
        "name": name
    }

    all_marks = list(subjects.values())

    for sub, marks in subjects.items():
        if sub not in df.columns:
            df[sub] = None
        stu_data[sub] = marks

    stu_data["no_subs"] = len(all_marks)
    stu_data["marks_sum"] = sum(all_marks)
    stu_data["marks_ave"] = sum(all_marks) / len(all_marks)
    stu_data["marks_max"] = max(all_marks)
    stu_data["marks_min"] = min(all_marks)

    for col in df.columns:
        stu_data.setdefault(col, None)

    df.loc[len(df)] = stu_data

    return jsonify({"message": "Student added", "data": stu_data})


# ------------------------------
# READ ALL STUDENTS (GET)
# ------------------------------
@app.route("/students", methods=["GET"])
def get_students():
    return jsonify(df.fillna("").to_dict(orient="records"))


# ------------------------------
# READ ONE STUDENT (GET)
# ------------------------------
@app.route("/students/<int:stu_id>", methods=["GET"])
def get_student(stu_id):
    student = df[df["stu_id"] == stu_id]
    if student.empty:
        return jsonify({"error": "Not found"}), 404
    return jsonify(student.fillna("").to_dict(orient="records")[0])


# ------------------------------
# UPDATE STUDENT (PUT)
# ------------------------------
@app.route("/students/<int:stu_id>", methods=["PUT"])
def update_student(stu_id):
    global df
    data = request.json

    if stu_id not in df["stu_id"].values:
        return jsonify({"error": "Not found"}), 404

    row_index = df.index[df["stu_id"] == stu_id][0]

    # Update name
    if "name" in data:
        df.loc[row_index, "name"] = data["name"]

    # Update subjects
    if "subjects" in data:
        subjects = data["subjects"]
        for sub, marks in subjects.items():
            if sub not in df.columns:
                df[sub] = None
            df.loc[row_index, sub] = marks

    # Recalculate
    fixed_cols = [
        "stu_id", "name", "no_subs",
        "marks_sum", "marks_ave",
        "marks_max", "marks_min"
    ]

    sub_cols = [c for c in df.columns if c not in fixed_cols]

    all_marks = [
        float(df.loc[row_index, s])
        for s in sub_cols
        if pd.notna(df.loc[row_index, s])
    ]

    if all_marks:
        df.loc[row_index, "no_subs"] = len(all_marks)
        df.loc[row_index, "marks_sum"] = sum(all_marks)
        df.loc[row_index, "marks_ave"] = sum(all_marks) / len(all_marks)
        df.loc[row_index, "marks_max"] = max(all_marks)
        df.loc[row_index, "marks_min"] = min(all_marks)

    return jsonify({"message": "Student updated"})


# ------------------------------
# DELETE STUDENT (DELETE)
# ------------------------------
@app.route("/students/<int:stu_id>", methods=["DELETE"])
def delete_student(stu_id):
    global df

    if stu_id not in df["stu_id"].values:
        return jsonify({"error": "Not found"}), 404

    row_index = df.index[df["stu_id"] == stu_id][0]
    df = df.drop(index=row_index)
    df.reset_index(drop=True, inplace=True)

    return jsonify({"message": "Student deleted"})


if __name__ == "__main__":
    app.run(debug=True)