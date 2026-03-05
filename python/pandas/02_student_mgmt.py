import pandas as pd

############## add students #################

def add_student(df):
    print("no of students right now is :- ",len(df))
    stu_id = len(df)+1
    name = input(f"Enter the name of student: :- ")
    while name == "":
        print("Name of student should not be empty")
        name = input(f"Enter the name of student: :- ")
    no_subs = int(input(f"Enter the no_subjects for student:- "))
    while no_subs <= 0:
        print("Subjects should be greater than 0")
        no_subs = int(input(f"Enter the no_subjects for student:- "))
    student_data = {
        "Id" : stu_id,
        "Name" : name,
        "no_of_subs" : no_subs
    }
    # df = pd.DataFrame([student_data])
    subject_marks = []
    for i in range(no_subs):
        sub_name = input(f"Enter the subject_name for {i+1} no:- ")
        while sub_name.strip() == "":
            print(f"sub_name cantnot be blank")
            sub_name = input(f"Enter the subject_name for {i+1} no:- ")
        sub_marks = float(input(f"Enter marks for {sub_name}: "))
        subject_marks.append(sub_marks)
        if sub_name not in df.columns:
            df[sub_name] = None
        student_data[sub_name] = sub_marks

    student_data["marks_sum"] = sum(subject_marks)
    student_data["marks_ave"] = sum(subject_marks) / len(subject_marks)
    student_data["marks_max"] = max(subject_marks)
    student_data["marks_min"] = min(subject_marks)

    for col in df.columns:
        if col not in student_data:
            student_data[col] = None
    df.loc[len(df)] = student_data
    print("\nStudent added successfully!\n")
    return df

############## show students #################
def show_students(df):
    if df.empty:
        print("No students found.")
    else:
        print(df.fillna("-").to_string(index=False))

############## edit students #################

def edit_students(df):
    print("no of students right now is :- ",len(df))
    if len(df) == 0:
        return
    print(f"Students id's are: {list(df['Id'])}")
    print("Do you want to see the data's: press 1 to yes or 0 to No")
    choice = int(input("Enter your choice:- "))
    if choice == 1:
        show_students(df)
    else:
        pass
    print("-----These are the id's-----")
    all_ids = list(df["Id"])
    print(all_ids)
    print()
    print("----edit_id----")
    edit_id = int(input(f"enter the edit_id:- "))
    while edit_id not in all_ids:
        print("edit id is not in all_ids enter again")
        edit_id = int(input(f"enter the edit_id:- "))
    row_index = df.index[df["Id"]== edit_id][0]
    # data_edit = df.loc[row_index].to_string(index=False)
    data_edit = df[df["Id"]==edit_id].to_string(index = False)
    print("----data_edit----")
    print(data_edit)
    # all_cols = list(df.columns)
    for col in df.columns:
        if col not in [ "Id", "marks_sum", "marks_ave", "marks_max", "marks_min"]:
            curr_val = df.loc[row_index, col]
            new_val = input(f"Enter the new_val for {col}, curr_val is {curr_val} press enterr to keep same:- ")
            if new_val.strip() != "":
                if col == "no_of_subs":
                    new_val = int(new_val)
                elif col == "Name":
                    new_val = str(new_val)
                else:
                    new_val = float(new_val)
                df.loc[row_index, col] = new_val
            else:
                new_val = curr_val
    sub_marks = []
    for col in df.columns:
        if col not in [ "Id", "marks_sum", "marks_ave", "marks_max", "marks_min", "Name", "no_of_subs"]:
            val = df.loc[row_index, col]
            if pd.notna(val):
                sub_marks.append(float(val))
    df.loc[row_index, "marks_sum"] = sum(sub_marks)
    df.loc[row_index, "marks_ave"] = sum(sub_marks)/len(sub_marks)
    df.loc[row_index, "marks_max"] = max(sub_marks)
    df.loc[row_index, "marks_min"] = min(sub_marks)
    
    print("-----New data-----")
    print(df.loc[[row_index]].to_string(index=False))
    print("----all data----")
    print(df.to_string(index=False))

############### edit 1 ##########################

def edit_students1(df):

    if df.empty:
        print("No students found.")
        return

    print(f"Available Ids: {list(df['Id'])}")

    edit_id = int(input("Enter Id to edit: "))
    if edit_id not in list(df["Id"]):
        print("Invalid Id")
        return

    row_index = df.index[df["Id"] == edit_id][0]

    print("\nCurrent Data:")
    print(df.loc[[row_index]].to_string(index=False))

    print("\n--- Editing Name ---")
    new_name = input(f"Name ({df.loc[row_index,'Name']}): ")
    if new_name.strip() != "":
        df.loc[row_index, "Name"] = new_name

    # Identify subject columns dynamically
    fixed_cols = ["Id", "Name", "no_of_subs",
                  "marks_sum", "marks_ave",
                  "marks_max", "marks_min"]

    subject_cols = [col for col in df.columns if col not in fixed_cols]

    print("\n--- Editing Existing Subjects ---")
    for sub in subject_cols:
        curr_val = df.loc[row_index, sub]
        new_val = input(f"{sub} ({curr_val}) - Enter new marks or press Enter: ")
        if new_val.strip() != "":
            df.loc[row_index, sub] = float(new_val)

    # Option to Add New Subject
    add_more = input("\nDo you want to add new subject? (y/n): ")
    if add_more.lower() == "y":
        new_sub = input("Enter new subject name: ")
        new_marks = float(input("Enter marks: "))

        if new_sub not in df.columns:
            df[new_sub] = None

        df.loc[row_index, new_sub] = new_marks

    # Option to Remove Subject
    remove_sub = input("\nDo you want to remove any subject? (y/n): ")
    if remove_sub.lower() == "y":
        print("Subjects:", subject_cols)
        del_sub = input("Enter subject name to remove: ")

        if del_sub in subject_cols:
            df.loc[row_index, del_sub] = None

    # 🔥 Recalculate Everything Automatically
    subject_cols = [col for col in df.columns if col not in fixed_cols]

    marks_list = []

    for sub in subject_cols:
        val = df.loc[row_index, sub]
        if pd.notna(val):
            marks_list.append(float(val))

    if marks_list:
        df.loc[row_index, "no_of_subs"] = len(marks_list)
        df.loc[row_index, "marks_sum"] = sum(marks_list)
        df.loc[row_index, "marks_ave"] = sum(marks_list) / len(marks_list)
        df.loc[row_index, "marks_max"] = max(marks_list)
        df.loc[row_index, "marks_min"] = min(marks_list)
    else:
        df.loc[row_index, "no_of_subs"] = 0
        df.loc[row_index, "marks_sum"] = 0
        df.loc[row_index, "marks_ave"] = 0
        df.loc[row_index, "marks_max"] = 0
        df.loc[row_index, "marks_min"] = 0

    print("\nUpdated Data:")
    print(df.loc[[row_index]].to_string(index=False))
############## main #################


def main():
    fixed_columns = [
    "Id", "Name", "no_of_subs",
    "marks_sum", "marks_ave",
    "marks_max", "marks_min"
]

    df = pd.DataFrame(columns=fixed_columns)
    while True:
        choice = int(input("Enter 1 to add student, 2 to show, 3 to edit 4 to exit: "))
        if choice == 1:
            df = add_student(df)
        elif choice == 2:
            show_students(df)
        elif choice == 3:
            edit_students(df)

        elif choice == 4:
            break
if __name__ == "__main__":
    main()
