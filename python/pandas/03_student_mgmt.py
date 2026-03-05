import pandas as pd

############### Add students ########################

def add_students(df):
    print(f"Current lenght of DataFrame is {len(df)}")
    print("--------- Adding Students ---------")
    name = input("Enter the name of student:- ")
    while name.strip() == "":
        print("name should not be blank")
        name = input("Enter the name of student:- ")
    stu_id = len(df)+1
    # no_sub = int(input(f"Enter the no_sub for stu_id-{stu_id}: "))
    # while no_sub < 1:
    #     print("enter atlease 1 sub")
    #     no_sub = int(input(f"Enter the no_sub for stu_id-{stu_id}: "))
    while True:
        try:
            no_sub = int(input(f"Enter the no_sub for stu_id-{stu_id}({name}): "))
            if no_sub < 1:
                print("enter atlease 1 sub")
                continue
            break
        except ValueError:
            print("invalid input of ValueError ")

    stu_data = {
        "stu_id" : stu_id,
        "name" : name,
        "no_sub" : no_sub
    }
    all_marks = []
    for i in range(no_sub):
        sub_name = input(f"enter the sub_name{i+1}:- ")
        while sub_name.strip() == "":
            print("sub_name cant be blank")
            sub_name = input(f"enter the sub_name{i+1}:- ")
        while True:
            try:
                sub_mark = float(input(f"enter the sub_mark for {sub_name}:- "))
                if sub_mark < 0:
                    print("marks cant be -ve ")
                    continue
                break
            except ValueError:
                print("invalid input of ValueError ")
        all_marks.append(sub_mark)
        if sub_name not in df.columns:
            df[sub_name] = None
        stu_data[sub_name] = sub_mark
    stu_data["marks_sum"] = sum(all_marks)
    stu_data["marks_ave"] = sum(all_marks) / len(all_marks)
    stu_data["marks_max"] = max(all_marks)
    stu_data["marks_min"] = min(all_marks)
    for col in df.columns:
        if col not in stu_data:
            stu_data[col] = None
    df.loc[len(df)] = stu_data
    print("\nStudent added successfully!\n")
    return df

############### show students ########################
def show_students(df):
    # if len(df) <= 0:
    #     print("No Data")
    if df.empty:
        print("No Data")
    else:
        print(df.fillna("-").to_string(index=False))

############### edit students ########################
def edit_students(df):
    if df.empty:
        print("No students found.")
        return df
    print("-----edit_students-----")
    all_cols = df.columns
    print(f"all_cols:- {list(all_cols)}")
    all_ids = list(df["stu_id"])
    print(f"all_ids:- {(all_ids)}")
    edit_id = int(input("Enter the edit_id:-  "))
    while edit_id not in all_ids:
            print("ID mismatch")
            edit_id = int(input("Enter the edit_id:-  "))
    row_index = df.index[df["stu_id"]== edit_id][0]
    edit_row = df.loc[[row_index]].to_string(index=False)
    print("edit_row:\n",edit_row)
    new_name = input("Enter new_name or press enter to keep same ")
    if new_name.strip() != "":
        df.loc[row_index, "name"] = new_name
    fix_cols = ["stu_id", "name", "no_sub", "marks_sum", "marks_ave", "marks_max", "marks_min"]
    sub_cols = [col for col in df.columns if col not in fix_cols]
    for sub in sub_cols:
        cur_val = df.loc[row_index, sub]
        while True:
            try:
                new_val = input(f"enter the new value for ({sub}:{cur_val}) or press enter to keep same:- ")
                if new_val.strip() == "":
                    break
                new_val = float(new_val)
                if new_val < 0 :
                    print("-ve marks")
                    continue
                df.loc[row_index, sub] = new_val
                break
            except ValueError:
                print("invalid input of ValueError ")
    marks_list = []
    for sub in sub_cols:
        sub_mark = df.loc[row_index, sub]
        if pd.notna(sub_mark):
            marks_list.append(float(sub_mark))
    if marks_list:
        df.loc[row_index, "no_sub"] = len(marks_list)
        df.loc[row_index, "marks_sum"] = sum(marks_list)
        df.loc[row_index, "marks_ave"] = sum(marks_list) / len(marks_list)
        df.loc[row_index, "marks_max"] = max(marks_list)
        df.loc[row_index, "marks_min"] = min(marks_list)
    else:
        df.loc[row_index, "no_sub"] = 0
        df.loc[row_index, "marks_sum"] = 0
        df.loc[row_index, "marks_ave"] = 0
        df.loc[row_index, "marks_max"] = 0
        df.loc[row_index, "marks_min"] = 0

    print("\nUpdated Data:")
    print(df.loc[[row_index]].to_string(index=False))
    return df


############### main func ########################


def main():
    fixed_columns = [
    "stu_id", "name", "no_sub",
    "marks_sum", "marks_ave",
    "marks_max", "marks_min" ]
    df = pd.DataFrame(columns=fixed_columns)
    while True:
        print("Student Management System")
        print("Enter 1 to add_students")
        print("Enter 2 to show_students")
        print("Enter 3 to edit_students")
        print("Enter 4 to Exit!")
        choice = int(input("Enter the choice:- "))
        if choice == 1:
            df = add_students(df)
        elif choice == 2:
            show_students(df)
        elif choice == 3:
            df = edit_students(df)


        elif choice == 4:
            break
        else:
            print("Invalid input")

if __name__ == "__main__":
    main()

    