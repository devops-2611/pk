from flask import Flask, request,jsonify
app = Flask(__name__)
emp_list = []
@app.route("/")
def home():
    return "welcome to home page"

@app.route("/add-emp", methods = ["POST"])
def add_emp():
    data = request.get_json()
    if not data:
        return jsonify({ "error": "no data found"}), 400
    emp_key = ["key_name", "key_id"]
    for each_emp in emp_key:
        if not data.get(each_emp):
            return jsonify({ "message" : f"{each_emp} is missing" }), 400
    emp_name = data.get("key_name")
    emp_id = int(data.get("key_id"))

    for each_emp in emp_list:
        if each_emp["id"] == emp_id:
            return jsonify({ "message": f"{each_emp} is already there"}), 409
    add_data = {
        "name" : emp_name,
        "id" : emp_id
    }

    emp_list.append(add_data)

    return jsonify ({"added_emp": f"{add_data} added successfully" }), 201

@app.route("/show-emp", methods = ["GET"])
def show_emp():
    return jsonify({ "message": "emp_lst are",
                    "emp_list": emp_list })

@app.route("/del-emp", methods = ["DELETE"])
def del_emp():
    data = request.get_json()
    if not data:
        return jsonify({ "error": "no data found"}), 400
    if not data.get("key_id"):
        return jsonify({ "error": "emp_id not provided"}), 400
    emp_id = int(data.get("key_id"))
    for that_emp in emp_list:
        if that_emp["id"] == emp_id:
            emp_list.remove(that_emp)
            return jsonify ({"message" : f"{that_emp} deleted",
                             "updated_list" : emp_list
                             })
    else:
        return jsonify({"error": "employee not found"}), 404
    
@app.route("/del-emp/<int:em_id>", methods = ["DELETE"])
def del_emp1(em_id):
    for that_emp in emp_list:
        if that_emp["id"] == em_id:
            emp_list.remove(that_emp)
            return jsonify ({
                "message" : f"{that_emp} deleted",
                "updated" : emp_list
                })
    else:
        return jsonify({"error": "employee not found"}), 404

@app.route("/update-emp", methods = ["PUT"])
def update_emp():
    data = request.get_json()
    if not data:
        return jsonify({"error": "no data"}),400
    key_list = ["key_id", "key_name"]
    for each_key in key_list:
        if not data.get(each_key):
            return jsonify({"error": f"{each_key} missing"}),400
    emp_id = int(data.get("key_id"))
    up_emp_name = data.get("key_name")
    for that_emp in emp_list:
        if that_emp["id"] == emp_id:
            that_emp["name"] = up_emp_name
            return jsonify({"messge": f"{that_emp} updated",
                            "updated_list": emp_list})
    else:
        return jsonify({"error": "data not found"})
    
@app.route ("/update-emp/<int: em_id>", methods = ["PUT"])
def update_emp1(em_id):
    data = request.get_json()
    if not data:
        return jsonify({"error": "data not found"}), 400
    
    if not data.get("key_name"):
        return jsonify({"error": "name not found"}), 400
    up_emp_name = data.get ("key_name")

    for that_emp in emp_list:
        if that_emp["id"] == em_id:
            that_emp["name"] = up_emp_name
            return jsonify({"messge": f"{that_emp} updated",
                            "updated_list": emp_list})
    else:
        return jsonify({"error": "not data found"}), 400
    
if __name__ == "__main__":
    app.run(debug=True)
